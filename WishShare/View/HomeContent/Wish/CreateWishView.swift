//
//  CreateWishView.swift
//  WishShare
//

import SwiftUI

struct CreateWishView: View {
    @ObservedObject var controller: WishListController
    let wishListID: WishList.ID
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var price: Decimal?
    @State private var link: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    fieldSection(title: "Link") {
                        TextField("Lim inn lenke til ønske", text: $link)
                    }
                    
                    fieldSection(title: "Navn") {
                        TextField("Navn på ønske", text: $name)
                    }
    
                    fieldSection(title: "Beskrivelse") {
                        TextField("Legg inn detaljer, f.eks. farge, størrelse...", text: $description)
                    }
    
                    fieldSection(title: "Pris") {
                        TextField("100", value: $price, format: .number)
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
            }

            Button {
                controller.addWish(to: wishListID, name: name, description: description, price: price, link: link.isEmpty ? nil : link)
                dismiss()
            } label: {
                Text("Legg til ønske")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.tint, in: RoundedRectangle(cornerRadius: 16))
            }
            .disabled(name.isEmpty)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationTitle("Legg til ønske")
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
    let controller = WishListController()
    NavigationStack {
        CreateWishView(controller: controller, wishListID: controller.wishLists[0].id)
    }
}
