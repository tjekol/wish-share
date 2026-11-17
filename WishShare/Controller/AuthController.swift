//
//  AuthController.swift
//  WishShare
//

import Auth
import Combine
import Foundation
import Supabase

@MainActor
final class AuthController: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUser: User?
    @Published var isAuthenticating = false
    @Published var errorMessage: String?

    // Eier-id som brukes når ingen er logget inn.
    var currentUserID: UUID {
        currentUser?.id ?? User.test.id
    }

    /// Henter en eksisterende Supabase-sesjon slik at man forblir innlogget mellom omstarter.
    func restoreSession() async {
        do {
            let session = try await supabase.auth.session
            currentUser = Self.makeUser(from: session.user)
            isLoggedIn = true
        } catch {
            // Ingen lagret sesjon – bruker må logge inn.
            isLoggedIn = false
        }
    }

    func signIn(with provider: Provider) async {
        isAuthenticating = true
        defer { isAuthenticating = false }

        do {
            let session = try await supabase.auth.signInWithOAuth(
                provider: provider,
                redirectTo: URL(string: "wishshare://auth-callback")
            )
            currentUser = Self.makeUser(from: session.user)
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    /// Demo uten Supabase – lokal bruker og lokale data.
    func continueAsDemo() {
        currentUser = .test
        isLoggedIn = true
    }

    func logOut() async {
        try? await supabase.auth.signOut()
        currentUser = nil
        isLoggedIn = false
    }

    private static func makeUser(from authUser: Auth.User) -> User {
        let metadata = authUser.userMetadata
        let name = metadata["full_name"]?.stringValue
            ?? metadata["name"]?.stringValue
            ?? authUser.email
            ?? "Ukjent"
        let username = authUser.email?.split(separator: "@").first.map(String.init) ?? "bruker"

        return User(
            id: authUser.id,
            username: username,
            name: name,
            createdAt: authUser.createdAt
        )
    }
}
