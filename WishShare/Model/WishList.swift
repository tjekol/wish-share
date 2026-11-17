//
//  WishList.swift
//  WishShare
//

import Foundation

struct WishList: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var name: String
    var occasion: Occasion
    var eventDate: Date
    var wishes: [Wish] = []
    var ownerID: UUID

    enum CodingKeys: String, CodingKey {
        case id, name, occasion, wishes
        case eventDate = "event_date"
        case ownerID = "owner_id"
    }

    enum Occasion: String, CaseIterable, Identifiable, Hashable, Codable {
        case birthday
        case christmas
        case wedding
        case other

        var id: String { rawValue }

        var displayName: String {
            switch self {
            case .birthday: "Bursdag"
            case .christmas: "Jul"
            case .wedding: "Bryllup"
            case .other: "Annet"
            }
        }
    }
}
