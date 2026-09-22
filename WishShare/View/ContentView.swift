//
//  ContentView.swift
//  WishShare
//
//  Created by Thea Jenny Kolnes on 14/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Friends", systemImage: "person.2") {
                FriendsView()
            }
            Tab("Profile", systemImage: "person.crop.circle") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
