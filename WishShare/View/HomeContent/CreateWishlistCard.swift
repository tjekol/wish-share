//
//  CreateWishlistCard.swift
//  WishShare
//

import SwiftUI

struct CreateWishlistCard: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.accentColor)
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                }
                .frame(width: 44, height: 44)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Lag en ny ønskeliste")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                    Text("Del ønsker med familie og venner!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentColor.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.accentColor, style: StrokeStyle(lineWidth: 1.5, dash: [6, 4]))
        )
    }
}

#Preview {
    CreateWishlistCard {}
        .padding()
}
