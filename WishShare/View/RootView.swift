//
//  RootView.swift
//  WishShare
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var authController: AuthController

    var body: some View {
        if authController.isLoggedIn {
            ContentView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AuthController())
        .environmentObject(WishListController())
}
