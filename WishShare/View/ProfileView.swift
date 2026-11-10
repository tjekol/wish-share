//
//  ProfileView.swift
//  WishShare
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var authController: AuthController
    @EnvironmentObject private var wishListController: WishListController

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.tint)
                        VStack(alignment: .leading) {
                            Text(authController.currentUser?.name ?? "Ikke innlogget")
                                .font(.headline)
                            if let username = authController.currentUser?.username {
                                Text("@\(username)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }

                Section {
                    Label("Instillinger", systemImage: "gear")
                    Label("Varslinger", systemImage: "bell")
                    //Label("Privacy", systemImage: "lock")
                }

                Section {
                    Button {
                        wishListController.clearData()
                        authController.logOut()
                    } label: {
                        Text("Logg ut")
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Din profil")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthController())
        .environmentObject(WishListController(demoData: true))
}
