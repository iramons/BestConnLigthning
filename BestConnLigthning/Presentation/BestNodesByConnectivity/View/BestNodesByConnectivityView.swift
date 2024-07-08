//
//  BestNodesByConnectivityView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI
import Shimmer

// MARK: BestNodesByConnectivityView

struct BestNodesByConnectivityView: View {

    @StateObject private var viewModel = BestNodeConnectivityViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.nodes, id: \.publicKey) { node in
                BestNodesByConnectivityItemView(node: node)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .listRowSpacing(2)
            .refreshable {
                Task { await viewModel.fetchBestNodesByConnectivity() }
            }
            .navigationTitle("Best connectivity")
            .overlay {
                if viewModel.isLoading {
                    BestNodesByConnectivityLoadingView()
                }
            }
            .alert(isPresented: .constant(viewModel.hasFailure)) {
                Alert(
                    title: Text("Ops"),
                    message: Text("Failed to load data."),
                    dismissButton: Alert.Button.destructive(
                        Text("Reload"),
                        action: {
                            Task { await viewModel.fetchBestNodesByConnectivity() }
                        }
                    )
                )
            }
        }
        .task { await viewModel.fetchBestNodesByConnectivity() }
    }
}

// MARK: - Preview

#Preview {
    BestNodesByConnectivityView()
}
