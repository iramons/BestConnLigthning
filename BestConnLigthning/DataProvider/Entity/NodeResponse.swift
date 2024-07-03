//
//  NodeResponse.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

typealias NodesResponse = [NodeResponse]

// MARK: - NodeResponse

struct NodeResponse: Codable {

    let publicKey: String?
    let alias: String?
    let channels: Double?
    let capacity: Double?
    let firstSeen: Int64?
    let updatedAt: Int64?
    let city: Locales?
    let country: Locales?
    let isoCode: String?
    let subdivision: String?

    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
}

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
