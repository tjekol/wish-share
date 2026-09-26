//
//  ProfileView.swift
//  WishShare
//

import SwiftUI

struct ProfileView: View {
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
                            Text("Your Name")
                                .font(.headline)
                            Text("Edit your profile")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }

                Section {
                    Label("Settings", systemImage: "gear")
                    Label("Notifications", systemImage: "bell")
                    //Label("Privacy", systemImage: "lock")
                }
            }
            .navigationTitle("Din profil")
        }
    }
}

#Preview {
    ProfileView()
}
