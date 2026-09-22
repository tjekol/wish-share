//
//  WishListView.swift
//  WishShare
//

import SwiftUI

struct HomeView: View {
    @StateObject private var controller = WishListController()
    @State private var isPresentingCreateWishList = false

    var body: some View {
        NavigationStack {
            List {
                CreateWishlistCard {
                    isPresentingCreateWishList = true
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

                Section("Dine ønskelister") {
                    ForEach(controller.wishLists) { wishList in
                        WishListRow(wishList: wishList)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    controller.delete(wishList)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("WishShare")
            .navigationDestination(isPresented: $isPresentingCreateWishList) {
                CreateListView(controller: controller)
            }
        }
    }
}

#Preview {
    HomeView()
}
