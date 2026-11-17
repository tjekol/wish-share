//
//  LoginView.swift
//  WishShare
//

import Auth
import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authController: AuthController
    @EnvironmentObject private var wishListController: WishListController

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 32))

            Text("WishShare")
                .font(.largeTitle)
                .fontDesign(.serif)

            Spacer()

            if let errorMessage = authController.errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }

            Button {
                Task { await authController.signIn(with: .google) }
            } label: {
                Label("Fortsett med Google", systemImage: "globe")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(.separator)))
            }

            // Krever betalt Apple Developer-medlemskap (Services ID) før den kan slås på.
            Button {
                Task { await authController.signIn(with: .apple) }
            } label: {
                Label("Fortsett med Apple", systemImage: "apple.logo")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(.separator)))
            }
            .disabled(true)

            Button {
                wishListController.loadDemoData()
                authController.continueAsDemo()
            } label: {
                Text("Prøv demo")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .overlay {
            if authController.isAuthenticating {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthController())
        .environmentObject(WishListController())
}
