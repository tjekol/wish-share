//
//  FriendsView.swift
//  WishShare
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "No Friends Yet",
                systemImage: "person.2",
                description: Text("Add friends to see and share wish lists together.")
            )
            .navigationTitle("Friends")
        
        }
    }
}

#Preview {
    FriendsView()
}
