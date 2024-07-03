//
//  LightningRemoteDataSource.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 03/07/24.
//

import Foundation
import Moya

class LightningRemoteDataSource {

    private var provider = MoyaProvider<LightningEndpoint>(plugins: [NetworkConfig.networkLogger])

    func getRankingsByConnectivity() async throws -> NodesResponse {
        return try await provider.async.request(.rankingsByConnectivity)
    }
}
