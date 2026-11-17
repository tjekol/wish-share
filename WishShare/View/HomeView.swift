//
//  HomeView.swift
//  WishShare
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var controller: WishListController
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
                    if controller.wishLists.isEmpty {
                        ContentUnavailableView(
                            "Ingen ønskerlister enda",
                            systemImage: "list",
                            description: Text("Lag en ønskeliste for å komme i gang!")
                        )
                        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 20))
                    }
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
                                Task { await controller.deleteWishList(to: wishList.id) }
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
            .task {
                await controller.fetchWishLists()
            }
            .alert(
                "Noe gikk galt",
                isPresented: Binding(
                    get: { controller.errorMessage != nil },
                    set: { if !$0 { controller.errorMessage = nil } }
                ),
                presenting: controller.errorMessage
            ) { _ in
                Button("OK", role: .cancel) {}
            } message: { message in
                Text(message)
            }
            .navigationDestination(isPresented: $isPresentingCreateWishList) {
                CreateWishListView(controller: controller)
            }
            .navigationDestination(item: $selectedWishList) { wishList in
                WishListView(wishList: wishList, controller: controller)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(WishListController(demoData: true))
}
