//
//  WishListController.swift
//  WishShare
//

import Combine
import Foundation
import PostgREST
import Supabase

@MainActor
final class WishListController: ObservableObject {
    @Published var wishLists: [WishList] = []
    @Published var errorMessage: String?

    private var isDemo = false

    init(demoData: Bool = false) {
        if demoData {
            loadDemoData()
        }
    }

    func loadDemoData() {
        isDemo = true
        wishLists = [
            WishList(
                name: "Bursdagsønsker",
                occasion: .birthday,
                eventDate: .now,
                wishes: [
                    Wish(name: "AirPods Pro", description: "Med aktiv støyreduksjon", price: 2999, link: "https://apple.com", isReserved: false),
                    Wish(name: "Kokebok", description: "Ny italiensk kokebok", price: 349, isReserved: false),
                ],
                ownerID: User.test.id
            ),
            WishList(
                name: "Juleønsker",
                occasion: .christmas,
                eventDate: .now,
                wishes: [
                    Wish(name: "Ullgenser", description: "Str. M, gjerne grå", price: 899, isReserved: false),
                ],
                ownerID: User.test.id
            ),
        ]
    }

    func clearData() {
        isDemo = false
        wishLists = []
    }

    func fetchWishLists() async {
        guard !isDemo else { return }
        do {
            wishLists = try await supabase
                .from("wish_lists")
                .select("*, wishes(*)")
                .order("created_at")
                .execute()
                .value
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func addWishList(name: String, occasion: WishList.Occasion, eventDate: Date, ownerID: UUID) async {
        let wishList = WishList(name: name, occasion: occasion, eventDate: eventDate, ownerID: ownerID)

        guard !isDemo else {
            wishLists.append(wishList)
            return
        }

        do {
            try await supabase
                .from("wish_lists")
                .insert(WishListPayload(wishList))
                .execute()
            await fetchWishLists()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteWishList(to wishListID: WishList.ID) async {
        wishLists.removeAll { $0.id == wishListID }
        guard !isDemo else { return }

        do {
            try await supabase
                .from("wish_lists")
                .delete()
                .eq("id", value: wishListID)
                .execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func addWish(to wishListID: WishList.ID, name: String, description: String, price: Decimal?, link: String?, isReserved: Bool = false) async {
        let wish = Wish(name: name, description: description, price: price, link: link, isReserved: isReserved)

        guard !isDemo else {
            appendLocally(wish, to: wishListID)
            return
        }

        do {
            try await supabase
                .from("wishes")
                .insert(WishPayload(wish, wishListID: wishListID))
                .execute()
            await fetchWishLists()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteWish(to wishListID: WishList.ID, _ wish: Wish) async {
        if let index = wishLists.firstIndex(where: { $0.id == wishListID }) {
            wishLists[index].wishes.removeAll { $0.id == wish.id }
        }
        guard !isDemo else { return }

        do {
            try await supabase
                .from("wishes")
                .delete()
                .eq("id", value: wish.id)
                .execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func appendLocally(_ wish: Wish, to wishListID: WishList.ID) {
        guard let index = wishLists.firstIndex(where: { $0.id == wishListID }) else { return }
        wishLists[index].wishes.append(wish)
    }
}

// Egne payloads for skriving: modellene inneholder felter som ikke finnes
// som kolonner (WishList.wishes) eller mangler felter som trengs (wish_list_id).
private struct WishListPayload: Encodable {
    let id: UUID
    let name: String
    let occasion: String
    let eventDate: Date
    let ownerID: UUID

    init(_ wishList: WishList) {
        id = wishList.id
        name = wishList.name
        occasion = wishList.occasion.rawValue
        eventDate = wishList.eventDate
        ownerID = wishList.ownerID
    }

    enum CodingKeys: String, CodingKey {
        case id, name, occasion
        case eventDate = "event_date"
        case ownerID = "owner_id"
    }
}

private struct WishPayload: Encodable {
    let id: UUID
    let wishListID: UUID
    let name: String
    let description: String
    let price: Decimal?
    let link: String?
    let isReserved: Bool

    init(_ wish: Wish, wishListID: UUID) {
        id = wish.id
        self.wishListID = wishListID
        name = wish.name
        description = wish.description
        price = wish.price
        link = wish.link
        isReserved = wish.isReserved
    }

    enum CodingKeys: String, CodingKey {
        case id, name, description, price, link
        case wishListID = "wish_list_id"
        case isReserved = "is_reserved"
    }
}
