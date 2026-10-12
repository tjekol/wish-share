//
//  WishRow.swift
//  WishShare
//
//  Created by Thea Jenny Kolnes on 12/10/2026.
//

import SwiftUI

struct WishRow: View {
    let wish: Wish

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(wish.name)
                .font(.title3)
            if !wish.description.isEmpty {
                Text(wish.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            if let price = wish.price {
                Text(price, format: .currency(code: "NOK"))
                    .font(.subheadline)
                    .foregroundStyle(Color.accentColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WishRow(wish: Wish(name: "HiLo", description: "Kortspill", price: 275))
        .padding()
}
