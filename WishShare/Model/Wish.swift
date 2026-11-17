//
//  Wish.swift
//  WishShare
//

import Foundation

struct Wish: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var price: Decimal?
    var link: String?
    var isReserved: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, description, price, link
        case isReserved = "is_reserved"
    }
}
