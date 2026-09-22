//
//  WishListController.swift
//  WishShare
//

import Combine
import Foundation

final class WishListController: ObservableObject {
    @Published var wishLists: [WishList] = [
        WishList(name: "Bursdagsønsker", occasion: .birthday, eventDate: .now),
        WishList(name: "Juleønsker", occasion: .christmas, eventDate: .now),
    ]

    func addWishList(name: String, occasion: WishList.Occasion, eventDate: Date) {
        wishLists.append(WishList(name: name, occasion: occasion, eventDate: eventDate))
    }

    func delete(_ wishList: WishList) {
        wishLists.removeAll { $0.id == wishList.id }
    }
}
