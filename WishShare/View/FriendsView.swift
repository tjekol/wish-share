//
//  FriendsView.swift
//  WishShare
//

import SwiftUI

struct FriendsView: View {
    @StateObject private var controller = AddFriendsController()
    @State private var isPresentingAddFriends = false
    
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Ingen venner enda",
                systemImage: "person.2",
                description: Text("Legg til venner for å dele ønskeliste")
            )
            .navigationTitle("Venner")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isPresentingAddFriends = true
                    } label: {
                        Label("Legg til venn", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $isPresentingAddFriends) {
                AddFriendView(controller: AddFriendsController())
            }
        }
    }
}

#Preview {
    FriendsView()
}
