//
//  AddFriendView.swift
//  WishShare
//

import SwiftUI

struct AddFriendView: View {
    @ObservedObject var controller: AddFriendsController
    @State private var searchText: String = ""

    private var filteredUsers: [User] {
        guard !searchText.isEmpty else { return controller.userList }
        return controller.userList.filter {
            $0.username.localizedCaseInsensitiveContains(searchText)
                || $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List(filteredUsers) { user in
            VStack(alignment: .leading, spacing: 2) {
                Text(user.name)
                    .font(.headline)
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Søk etter venner")
        .navigationTitle("Legg til venner")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AddFriendView(controller: AddFriendsController())
    }
}
