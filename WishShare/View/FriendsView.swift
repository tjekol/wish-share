//
//  FriendsView.swift
//  WishShare
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Ingen venner enda",
                systemImage: "person.2",
                description: Text("Legg til venner for å dele ønskelister")
            )
            .navigationTitle("Venner")
        
        }
        .toolbar {
            
        }
    }
}

#Preview {
    FriendsView()
}
