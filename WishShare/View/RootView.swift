//
//  RootView.swift
//  WishShare
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var authController: AuthController

    var body: some View {
        Group {
            if authController.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .task {
            await authController.restoreSession()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AuthController())
        .environmentObject(WishListController())
}
