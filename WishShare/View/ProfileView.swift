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
                            Text("Ditt navn")
                                .font(.headline)
                            Text("Rediger profil")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }

                Section {
                    Label("Instillinger", systemImage: "gear")
                    Label("Varslinger", systemImage: "bell")
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
