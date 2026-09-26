//
//  WishListRow.swift
//  WishShare
//

import SwiftUI

struct WishListRow: View {
    let wishList: WishList

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(wishList.name)
                .font(.title2)
                .fontDesign(.serif)

            Text("\(wishList.occasion.rawValue) • \(wishList.eventDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WishListRow(wishList: WishList(name: "Bursdagsønsker", occasion: .birthday, eventDate: .now))
        .padding()
}
