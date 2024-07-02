//
//  NodeResponse.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

// MARK: - NodeResponse

struct NodeResponse: Codable {

    let publicKey: String?
    let alias: String?
    let channels: Int?
    let capacity: Int?
    let firstSeen: Int?
    let updatedAt: Int?
    let city: [String: String]?
    let country: [String: String]?
    let isoCode: String?
    let subdivision: String?

    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
}

typealias NodesResponse = [NodeResponse]

extension NodeResponse {
    func toNode() -> Node {
        return Node(
            publicKey: publicKey ?? "",
            alias: alias ?? "",
            channels: channels ?? 0,
            capacity: capacity ?? 0,
            firstSeen: firstSeen ?? 0,
            updatedAt: updatedAt ?? 0,
            city: city,
            country: country,
            isoCode: isoCode ?? "",
            subdivision: subdivision ?? ""
        )
    }
}
