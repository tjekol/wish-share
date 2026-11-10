//
//  AuthController.swift
//  WishShare
//

import Combine
import Foundation

final class AuthController: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUser: User?

    // Eier-id som brukes når ingen er logget inn.
    var currentUserID: UUID {
        currentUser?.id ?? User.test.id
    }

    func logIn() {
        // TODO: Koble til ekte innlogging
        currentUser = .test
        isLoggedIn = true
    }

    func logOut() {
        currentUser = nil
        isLoggedIn = false
    }
}
