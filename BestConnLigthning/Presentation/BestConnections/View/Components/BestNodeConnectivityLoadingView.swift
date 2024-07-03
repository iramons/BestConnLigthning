//
//  BestNodeConnectivityLoadingView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI
import Shimmer

// MARK: BestNodeConnectivityLoadingView

struct BestNodeConnectivityLoadingView: View {

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Spacer(minLength: 110)
                ForEach(1..<4) { _ in
                    BestNodeConnectivityItemView(node: representableNode)
                        .frame(height: 260)
                        .padding(.horizontal, 20)
                        .redacted(reason: .placeholder)
                        .shimmering()
                }
            }
        }
    }
}

private extension BestNodeConnectivityLoadingView {
    var representableNode: Node {
        return .init(
            publicKey: "-------------",
            alias: "----",
            channels: 00000,
            capacity: 000000000,
            firstSeen: Date(),
            updatedAt: Date(),
            city: "------",
            country: "-----",
            isoCode: "---",
            subdivision: "---"
        )
    }
}

// MARK: - Preview

#Preview {
    BestNodeConnectivityLoadingView()
}
