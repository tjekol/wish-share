//
//  WishShareApp.swift
//  WishShare
//
//  Created by Thea Jenny Kolnes on 14/09/2026.
//

import SwiftUI

@main
struct WishShareApp: App {
    @StateObject private var authController = AuthController()
    @StateObject private var wishListController = WishListController()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(authController)
        .environmentObject(wishListController)
    }
}
