//
//  BestNodeConnectivityView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI

// MARK: BestNodeConnectivityView

struct BestNodeConnectivityView: View {

    @StateObject private var viewModel = BestConnectionsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.nodes, id: \.id) { node in
                BestNodeConnectivityItemView(node: node)
                    .listRowSeparator(.hidden)
            }
            .lineSpacing(2)
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .refreshable {
                viewModel.getBestConnections()
            }
            .navigationTitle("Best connectivity")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
        .onAppear {
            viewModel.getBestConnections()
        }
    }
}

// MARK: - Preview

#Preview {
    BestNodeConnectivityView()
}
