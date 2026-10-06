//
//  WishListController.swift
//  WishShare
//

import Combine
import Foundation

final class WishListController: ObservableObject {
    @Published var wishLists: [WishList] = [
        WishList(
            name: "Bursdagsønsker",
            occasion: .birthday,
            eventDate: .now,
            wishes: [
                Wish(name: "AirPods Pro", description: "Med aktiv støyreduksjon", price: 2999, link: "https://apple.com"),
                Wish(name: "Kokebok", description: "Ny italiensk kokebok", price: 349, link: ""),
            ]
        ),
        WishList(
            name: "Juleønsker",
            occasion: .christmas,
            eventDate: .now,
            wishes: [
                Wish(name: "Ullgenser", description: "Str. M, gjerne grå", price: 899, link: ""),
            ]
        ),
    ]

    func addWishList(name: String, occasion: WishList.Occasion, eventDate: Date) {
        wishLists.append(WishList(name: name, occasion: occasion, eventDate: eventDate))
    }

    func delete(_ wishList: WishList) {
        wishLists.removeAll { $0.id == wishList.id }
    }
}
