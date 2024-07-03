//
//  BestNodeConnectivityView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI
import Shimmer

// MARK: BestNodeConnectivityView

struct BestNodeConnectivityView: View {

    @StateObject private var viewModel = BestConnectionsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.nodes, id: \.id) { node in
                BestNodeConnectivityItemView(node: node)
                    .listRowSeparator(.hidden)
                    .disabled(viewModel.isLoading)
                    .opacity(viewModel.isLoading ? 0 : 1)
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
                    BestNodeConnectivityLoadingView()
                }
            }
            .alert(isPresented: .constant(viewModel.hasFailure)) {
                Alert(
                    title: Text("Ops"),
                    message: Text("Failed to load data."),
                    dismissButton: Alert.Button.destructive(
                        Text("Reload"),
                        action: { viewModel.getBestConnections() }
                    )
                )
            }
            .listRowSeparator(.hidden)
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
