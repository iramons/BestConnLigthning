//
//  BestNodesByConnectivityItemView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import SwiftUI

// MARK: BestNodesByConnectivityItemView

struct BestNodesByConnectivityItemView: View {

    @State var node: Node

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            BestNodesByConnectityItemInfoView(title: "Public Key:", value: node.publicKey)
            BestNodesByConnectityItemInfoView(title: "Alias:", value: node.alias)
            BestNodesByConnectityItemInfoView(title: "Channels:", value: node.channels.description)
            BestNodesByConnectityItemInfoView(title: "Capacity:", value: node.bitcoinDescription)
            BestNodesByConnectityItemInfoView(title: "First seen:", value: node.firstSeen.formatted(.dateTime))
            BestNodesByConnectityItemInfoView(title: "Updated at:", value: node.updatedAt.formatted(.dateTime))
            BestNodesByConnectityItemInfoView(title: "City:", value: node.city?.description)
            BestNodesByConnectityItemInfoView(title: "Country:", value: node.country?.description)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 16))
        .shadow(radius: 1)
        .padding(.horizontal, 4)
    }
}

// MARK: - Preview

#Preview {
    let mock = Node(publicKey: "xYxdAzsFghHtE", alias: "Node test", channels: 13, capacity: 121, firstSeen: Date(), updatedAt: Date(), city: nil, country: nil, isoCode: "isoCodeExtSghtr", subdivision: "StringSubsci")
    return BestNodesByConnectivityItemView(node: mock)
}
