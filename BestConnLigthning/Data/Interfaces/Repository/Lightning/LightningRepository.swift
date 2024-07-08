//
//  LightningRepository.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 03/07/24.
//

import Foundation

protocol LightningRepository {
    func getBestNodesByConnectivity() async throws -> Nodes
}
