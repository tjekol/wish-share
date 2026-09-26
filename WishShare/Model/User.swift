//
//  User.swift
//  WishShare
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var username: String
    var name: String
    var createdAt: Date
}
