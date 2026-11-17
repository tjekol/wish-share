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
                .font(.title3)
                .fontDesign(.serif)

            Text("\(wishList.occasion.displayName) • \(wishList.eventDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    let controller = WishListController(demoData: true)
    WishListRow(wishList: controller.wishLists[0])
        .padding()
}
