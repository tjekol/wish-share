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
        case birthday = "Birthday"
        case christmas = "Christmas"
        case wedding = "Wedding"
        case graduation = "Graduation"
        case other = "Other"

        var id: String { rawValue }
    }
}
