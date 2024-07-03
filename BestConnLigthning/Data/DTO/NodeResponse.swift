//
//  NodeResponse.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

// MARK: - NodeResponse

struct NodeResponse: Decodable {

    let publicKey: String?
    let alias: String?
    let channels: Double?
    let capacity: Double?
    let firstSeen: Int64?
    let updatedAt: Int64?
    let city: LocalesResponse?
    let country: LocalesResponse?
    let isoCode: String?
    let subdivision: String?

    enum CodingKeys: String, CodingKey {
        case publicKey
        case alias
        case channels
        case capacity
        case firstSeen
        case updatedAt
        case city
        case country
        case isoCode = "iso_code"
        case subdivision
    }
}

typealias NodesResponse = [NodeResponse]

// MARK: - Mappings to Node

extension NodeResponse {
    func toNode() -> Node {
        return Node(
            publicKey: publicKey ?? "",
            alias: alias ?? "",
            channels: channels ?? 0,
            capacity: capacity ?? 0,
            firstSeen: Date(timeIntervalSince1970: TimeInterval(firstSeen ?? 0)),
            updatedAt: Date(timeIntervalSince1970: TimeInterval(updatedAt ?? 0)),
            city: city?.default,
            country: country?.default,
            isoCode: isoCode ?? "",
            subdivision: subdivision ?? ""
        )
    }
}
