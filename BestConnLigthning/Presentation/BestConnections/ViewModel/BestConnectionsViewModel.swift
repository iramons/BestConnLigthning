//
//  BestConnectionsViewModel.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import Moya

class BestConnectionsViewModel: ObservableObject {

    @Published private(set) var nodes: [Node] = []
    @Published var loadingState: LoadingState = .none
    var isLoading: Bool { loadingState == .loading }
    
    private var provider = MoyaProvider<LightningEndpoint>(plugins: [NetworkConfig.networkLogger])

    @MainActor
    func getBestConnections() {
        loadingState = .loading

        provider.request(.rankingsByConnectivity) { result in
            switch result {
            case .success(let response):
                print(response)

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
                } catch {
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }

        loadingState = .none
    }
}
