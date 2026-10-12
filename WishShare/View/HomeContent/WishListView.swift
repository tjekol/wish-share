//
//  WishListView.swift
//  WishShare
//

import SwiftUI

struct WishListView: View {
    let wishListID: WishList.ID
    @ObservedObject var controller: WishListController
    @State private var isPresentingCreateWish = false
    @State private var selectedWish: Wish?
    @Environment(\.dismiss) private var dismiss

    private var wishList: WishList {
        controller.wishLists.first(where: { $0.id == wishListID }) ?? WishList(name: "", occasion: .other, eventDate: .now)
    }

    init(wishList: WishList, controller: WishListController) {
        self.wishListID = wishList.id
        self.controller = controller
    }

    var body: some View {
        List {
            Section {
                WishListHeader(wishList: wishList) {
                    isPresentingCreateWish = true
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)

            Section("Ønsker") {
                if wishList.wishes.isEmpty {
                    ContentUnavailableView(
                        "Ingen ønsker enda",
                        systemImage: "gift",
                        description: Text("Legg til et ønske for å komme i gang.")
                    )
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20))
                } else {
                    ForEach(wishList.wishes) { wish in
                        Button {
                            selectedWish = wish
                        } label: {
                            WishRow(wish: wish)
                        }
                        .buttonStyle(.plain)
                        .listRowInsets(EdgeInsets(top: 3, leading: 16, bottom: 3, trailing: 16))
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                controller.deleteWish(to: wishListID, wish)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .fontDesign(.serif)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle(wishList.occasion.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isPresentingCreateWish) {
            CreateWishView(controller: controller, wishListID: wishListID)
        }
        .sheet(item: $selectedWish) { wish in
            WishView(controller: controller, wishListID: wishListID, wish: wish)
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    controller.deleteWishList(to: wishListID)
                    dismiss()
                } label: {
                    Label("Slett liste", systemImage: "trash")
                }
            }
        }
    }
}

#Preview {
    let controller = WishListController()
    NavigationStack {
        WishListView(wishList: controller.wishLists[0], controller: controller)
    }
}
