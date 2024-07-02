//
//  Node.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

struct Node: Identifiable {
    let id = UUID()
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Int
    let updatedAt: Int
    let city: [String: String]?
    let country: [String: String]?
    let isoCode: String
    let subdivision: String
}
