//
//  WishList.swift
//  WishShare
//

import Foundation

struct WishList: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var occasion: Occasion
    var eventDate: Date
    var wishes: [Wish] = []

    enum Occasion: String, CaseIterable, Identifiable, Hashable {
        case birthday = "Bursdag"
        case christmas = "Jul"
        case wedding = "Bryllup"
        case other = "Annet"

        var id: String { rawValue }
    }
}
