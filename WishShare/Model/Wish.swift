//
//  Wish.swift
//  WishShare
//

import Foundation

struct Wish: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var price: Decimal
    var link: String
}
