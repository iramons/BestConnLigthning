//
//  BestNodeConnectivityItemView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import Foundation
import SwiftUI

// MARK: BestNodeConnectivityItemView

struct BestNodeConnectivityItemView: View {

    @State var node: Node

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            BestNodeConnectityItemInfoView(title: "Public Key:", value: node.publicKey)
            BestNodeConnectityItemInfoView(title: "Alias:", value: node.alias)
            BestNodeConnectityItemInfoView(title: "Channels:", value: node.channels.description)
            BestNodeConnectityItemInfoView(title: "Capacity:", value: node.capacity.description)
            BestNodeConnectityItemInfoView(title: "First seen:", value: node.firstSeen.description)
            BestNodeConnectityItemInfoView(title: "Updated at:", value: node.updatedAt.description)
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
    let mock = Node(publicKey: "xYxdAzsFghHtE", alias: "Node test", channels: 13, capacity: 121, firstSeen: 1434343, updatedAt: 234343434, city: nil, country: nil, isoCode: "isoCodeExtSghtr", subdivision: "StringSubsci")
    return BestNodeConnectivityItemView(node: mock)
}
