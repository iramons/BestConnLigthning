//
//  LightningRemoteRepository.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 03/07/24.
//

import Foundation
import Moya

class LightningRemoteRepository: LightningRepository {

    let dataSource = LightningRemoteDataSource()

    func getBestNodesByConnectivity() async throws -> Nodes {
        let nodesResponse = try await dataSource.getRankingsByConnectivity()
        return nodesResponse.map({ $0.toNode() })
    }
}
