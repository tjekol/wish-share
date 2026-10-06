//
//  WishListView.swift
//  WishShare
//

import SwiftUI

struct HomeView: View {
    @StateObject private var controller = WishListController()
    @State private var isPresentingCreateWishList = false
    @State private var selectedWishList: WishList?

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Hva ønsker du deg?")
                        .font(.title)
                        .fontDesign(.serif)

                    CreateWishlistCard {
                        isPresentingCreateWishList = true
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

                Section("Dine ønskelister") {
                    ForEach(controller.wishLists) { wishList in
                        Button {
                            selectedWishList = wishList
                        } label: {
                            WishListRow(wishList: wishList)
                        }
                        .buttonStyle(.plain)
                        .listRowInsets(EdgeInsets(top: 3, leading: 16, bottom: 3, trailing: 16))
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                controller.delete(wishList)
                            } label: {
                                Label("Delete", systemImage: "trash")
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
            .navigationTitle("WishShare")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $isPresentingCreateWishList) {
                CreateListView(controller: controller)
            }
            .navigationDestination(item: $selectedWishList) { wishList in
                WishListView(wishList: wishList)
            }
        }
    }
}

#Preview {
    HomeView()
}
