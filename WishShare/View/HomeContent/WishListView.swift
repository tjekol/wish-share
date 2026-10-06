//
//  WishListView.swift
//  WishShare
//

import SwiftUI

struct WishListView: View {
    let wishList: WishList

    var body: some View {
        List {
            Section("Ønsker") {
                if wishList.wishes.isEmpty {
                    ContentUnavailableView(
                        "Ingen ønsker enda",
                        systemImage: "gift",
                        description: Text("Legg til et ønske for å komme i gang.")
                    )
                } else {
                    ForEach(wishList.wishes) { wish in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(wish.name)
                                .font(.headline)
                            if !wish.description.isEmpty {
                                Text(wish.description)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Text(wish.price, format: .currency(code: "NOK"))
                                .font(.subheadline)
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .safeAreaInset(edge: .top) {
            WishListHeader(wishList: wishList) {
                // TODO: Add a new wish
            }
        }
        .navigationTitle(wishList.occasion.rawValue + "sliste")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        WishListView(
            wishList: WishList(
                name: "Bursdagsønsker",
                occasion: .birthday,
                eventDate: .now,
                wishes: [
                    Wish(name: "AirPods Pro", description: "Med aktiv støyreduksjon", price: 2999, link: "https://apple.com"),
                ]
            )
        )
    }
}
