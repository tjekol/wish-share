//
//  WishListController.swift
//  WishShare
//

import Combine
import Foundation

final class WishListController: ObservableObject {
    @Published var wishLists: [WishList] = []

    init(demoData: Bool = false) {
        if demoData {
            loadDemoData()
        }
    }

    func loadDemoData() {
        wishLists = [
            WishList(
                name: "Bursdagsønsker",
                occasion: .birthday,
                eventDate: .now,
                wishes: [
                    Wish(name: "AirPods Pro", description: "Med aktiv støyreduksjon", price: 2999, link: "https://apple.com", isReserved: false),
                    Wish(name: "Kokebok", description: "Ny italiensk kokebok", price: 349, isReserved: false),
                ],
                owner: "Thea Jenny"
            ),
            WishList(
                name: "Juleønsker",
                occasion: .christmas,
                eventDate: .now,
                wishes: [
                    Wish(name: "Ullgenser", description: "Str. M, gjerne grå", price: 899, isReserved: false),
                ],
                owner: "Thea Jenny"
            ),
        ]
    }

    func clearData() {
        wishLists = []
    }

    func addWishList(name: String, occasion: WishList.Occasion, eventDate: Date) {
        wishLists.append(WishList(name: name, occasion: occasion, eventDate: eventDate, owner: "Thea Jenny"))
    }
    
    func deleteWishList(to wishListID: WishList.ID) {
        wishLists.removeAll() { $0.id == wishListID }
    }
    
    func addWish(to wishListID: WishList.ID, name: String, description: String, price: Decimal?, link: String?, isReserved: Bool = false) {
        guard let index = wishLists.firstIndex(where: { $0.id == wishListID }) else { return }
        wishLists[index].wishes.append(Wish(name: name, description: description, price: price, link: link, isReserved: isReserved))
    }
    
    func deleteWish(to wishListID: WishList.ID, _ wish: Wish) {
        guard let index = wishLists.firstIndex(where: { $0.id == wishListID }) else { return }
        wishLists[index].wishes.removeAll() { $0.id == wish.id }
    }
}
