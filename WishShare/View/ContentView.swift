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
            Tab("Hjem", systemImage: "house") {
                HomeView()
            }
            Tab("Venner", systemImage: "person.2") {
                FriendsView()
            }
            Tab("Profil", systemImage: "person.crop.circle") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
