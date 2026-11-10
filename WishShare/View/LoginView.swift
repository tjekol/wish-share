//
//  LoginView.swift
//  WishShare
//

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

            Button {
                authController.logIn()
            } label: {
                Text("Logg inn")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
            }

            Button {
                wishListController.loadDemoData()
                authController.logIn()
            } label: {
                Text("Prøv demo")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(.separator)))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthController())
        .environmentObject(WishListController())
}
