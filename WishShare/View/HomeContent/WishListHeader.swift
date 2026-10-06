//
//  WishListHeader.swift
//  WishShare
//

import SwiftUI

struct WishListHeader: View {
    let wishList: WishList
    let onAddWish: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(wishList.name)
                .font(.title)
                .fontDesign(.serif)
                .foregroundStyle(.primary)

            Text(wishList.eventDate.formatted(date: .abbreviated, time: .omitted))
                .font(.subheadline)
                .fontDesign(.serif)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                ShareLink(item: "Sjekk ut ønskelisten min: \(wishList.name)") {
                    Label("Del liste", systemImage: "square.and.arrow.up")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 20)
                .foregroundStyle(.primary)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemGroupedBackground)))
                .overlay(RoundedRectangle(cornerRadius: 12).strokeBorder(Color(.separator)))

                Button(action: onAddWish) {
                    Label("Legg til ønske", systemImage: "plus")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 20)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.accentColor))
            }
            .padding(.top)
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    WishListHeader(
        wishList: WishList(name: "Bursdagsønsker", occasion: .birthday, eventDate: .now),
        onAddWish: {}
    )
}
