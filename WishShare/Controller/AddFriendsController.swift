//
//  WishListController.swift
//  WishShare
//

import Combine
import Foundation

final class AddFriendsController: ObservableObject {
    @Published var userList: [User] = [
        User(username: "hkolnes", name: "Henriette", createdAt: Date.now),
        User(username: "kassa05", name: "Kasper", createdAt: Date.now),
        User(username: "kolken40", name: "Kenneth", createdAt: Date.now)
    ]
}
