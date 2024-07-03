//
//  BestNodesByConnectityItemInfoView.swift
//  BestConnLigthning
//
//  Created by Ramon Santos on 02/07/24.
//

import SwiftUI

// MARK: - BestNodesByConnectityItemInfoView

struct BestNodesByConnectityItemInfoView: View {

    @State var title: String
    @State var value: String?

    var body: some View {
        HStack(alignment: .top) {
            if let value {
                Text(title)
                    .bold()
                Text(value)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    BestNodesByConnectityItemInfoView(title: "title", value: "value")
}
