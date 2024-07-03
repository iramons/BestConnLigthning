//
//  BestConnectionsViewModel.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import Moya

// MARK: BestConnectionsViewModel

class BestConnectionsViewModel: ObservableObject {

    @Published private(set) var nodes: [Node] = []
    @Published var loadingState: LoadingState = .none
    var isLoading: Bool { loadingState == .loading }
    var hasFailure: Bool { loadingState == .failure }

    private var provider = MoyaProvider<LightningEndpoint>(plugins: [NetworkConfig.networkLogger])
}

// MARK: Requests

extension BestConnectionsViewModel {

    func getBestConnections() {
        loadingState = .loading

        provider.request(.rankingsByConnectivity) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                do {
                    let nodesResponse = try response.map(NodesResponse.self, failsOnEmptyData: true)

                    var newNodes: [Node] = []

                    nodesResponse.forEach { response in
                        newNodes.append(response.toNode())
                    }

                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        self.nodes = newNodes
                    }
                    loadingState = .success
                } catch {
                    loadingState = .failure
                    print(error)
                }

            case .failure(let error):
                loadingState = .failure
                print(error)
            }
        }
    }
}
