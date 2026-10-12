//
//  WishView.swift
//  WishShare
//
//  Created by Thea Jenny Kolnes on 12/10/2026.
//

import SwiftUI

struct WishView: View {
    @ObservedObject var controller: WishListController
    let wishListID: WishList.ID
    let wish: Wish
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text(wish.name)
                        .font(.title)
                        .fontDesign(.serif)
                    if let price = wish.price {
                        Text(price.formatted())
                            .font(.title3)
                            .fontDesign(.serif)
                            .foregroundStyle(.accent)

                    }
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Notat")
                        .font(.caption)
                        .textCase(.uppercase)
                    Text(wish.description)
                        .font(.body)
                }
                Divider()
                if let link = wish.link, let url = URL(string: link) {
                    Link(link, destination: url)
                }
                Spacer()
                Button {
                    
                } label: {
                    Label("Reserver ønske", systemImage: "gift")
                }
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.tint, in: RoundedRectangle(cornerRadius: 16))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .backgroundStyle(Color(.secondarySystemBackground))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Gå tilbake", systemImage: "xmark.circle")
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // edit
                    } label: {
                        Label("Endre ønske", systemImage: "pencil")
                    }
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        controller.deleteWish(to: wishListID, wish)
                        dismiss()
                    } label: {
                        Label("Slett ønske", systemImage: "trash")
                    }
                }
            }
        }
    }
}

#Preview {
    let controller = WishListController()
    
    WishView(
        controller: controller,
        wishListID: controller.wishLists[0].id,
        wish: controller.wishLists[0].wishes[0]
    )
}
