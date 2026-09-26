//
//  WishList.swift
//  WishShare
//

import Foundation

struct WishList: Identifiable {
    let id = UUID()
    var name: String
    var occasion: Occasion
    var eventDate: Date

    enum Occasion: String, CaseIterable, Identifiable {
        case birthday = "Bursdag"
        case christmas = "Jul"
        case wedding = "Bryllup"
        case other = "Annet"

        var id: String { rawValue }
    }
}
