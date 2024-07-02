//
//  BestNodeConnectityItemInfoView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI

// MARK: - BestNodeConnectityItemInfoView

struct BestNodeConnectityItemInfoView: View {

    @State var title: String
    @State var value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .bold()

            Text(value)
        }
    }
}

// MARK: - Preview

#Preview {
    BestNodeConnectityItemInfoView(title: "title", value: "value")
}
