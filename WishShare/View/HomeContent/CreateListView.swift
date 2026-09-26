//
//  CreateWishList.swift
//  WishShare
//

import SwiftUI

struct CreateListView: View {
    @ObservedObject var controller: WishListController
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var occasion: WishList.Occasion = .birthday
    @State private var eventDate: Date = .now

    var body: some View {
        VStack(spacing: 16) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    fieldSection(title: "Ønskeliste navn") {
                        TextField("Bursdagsønsker🎂", text: $title)
                    }
                    fieldSection(title: "Anledning") {
                        Picker("", selection: $occasion) {
                            ForEach(WishList.Occasion.allCases) { occasion in
                                Text(occasion.rawValue).tag(occasion)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    fieldSection(title: "Dato") {
                        DatePicker("", selection: $eventDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
            }

            Button {
                controller.addWishList(name: title, occasion: occasion, eventDate: eventDate)
                dismiss()
            } label: {
                Text("Create Wishlist")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
            }
            .disabled(title.isEmpty)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationTitle("New Wishlist")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func fieldSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.subheadline)
                .foregroundStyle(.secondary)
            

            content()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    NavigationStack {
        CreateListView(controller: WishListController())
    }
}
