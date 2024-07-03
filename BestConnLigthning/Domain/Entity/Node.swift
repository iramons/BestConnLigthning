//
//  Node.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation

struct Node {
    let publicKey: String
    let alias: String
    let channels: Double
    let capacity: Double
    let firstSeen: Date
    let updatedAt: Date
    let city: String?
    let country: String?
    let isoCode: String
    let subdivision: String
}

typealias Nodes = [Node]

extension Node {
    var bitcoin: Double { capacity / Cryptocurrencies.bitcoin }

    var bitcoinDescription: String? {
        guard let formattedBitcoin = makeFormattedBitcoin() else { return nil }
        return "\(formattedBitcoin) BTC"
    }

    private func makeFormattedBitcoin() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.decimalSeparator = ","
        numberFormatter.minimumFractionDigits = 8
        numberFormatter.maximumFractionDigits = 9
        return numberFormatter.string(from: NSNumber(value: bitcoin))
    }
}


