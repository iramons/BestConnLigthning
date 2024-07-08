//
//  BestNodeConnectivityViewModel.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import Resolver

// MARK: BestNodeConnectivityViewModel

class BestNodeConnectivityViewModel: ObservableObject {

    @Injected private var lightningRepository: LightningRepository
    @Published private(set) var nodes: Nodes = []
    @Published var viewState: ViewState = .none
    
    var isLoading: Bool { viewState == .loading }
    var hasFailure: Bool { viewState == .failure }
}

// MARK: Requests

extension BestNodeConnectivityViewModel {

    @MainActor
    func fetchBestNodesByConnectivity() async {
        viewState = .loading
        do {
            let nodes = try await lightningRepository.getBestNodesByConnectivity()
            self.nodes = nodes
            viewState = .success
        } catch {
            viewState = .failure
            print(error)
        }
    }
}
