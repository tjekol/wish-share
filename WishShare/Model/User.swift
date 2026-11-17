//
//  User.swift
//  WishShare
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var username: String
    var name: String
    var createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case createdAt = "created_at"
    }
}

extension User {
    // Midlertidig bruker frem til ekte innlogging er på plass. Fast id slik at
    // ønskelister laget i én økt fortsatt har samme eier ved neste oppstart.
    static let test = User(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
        username: "demo",
        name: "Demo",
        createdAt: .now
    )
}
