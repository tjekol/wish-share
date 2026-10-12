//
//  SupabaseManager.swift
//  WishShare
//
//  Created by Thea Jenny Kolnes on 12/10/2026.
//

import Foundation
import Supabase

private let supabaseURL: URL = {
    guard
        let urlString = Bundle.main.infoDictionary?["SUPABASE_URL"] as? String,
        let url = URL(string: urlString)
    else {
        fatalError("Missing or invalid SUPABASE_URL in Info.plist — check Secrets.xcconfig.")
    }
    return url
}()

private let supabaseKey: String = {
    guard let key = Bundle.main.infoDictionary?["SUPABASE_ANON_KEY"] as? String else {
        fatalError("Missing SUPABASE_ANON_KEY in Info.plist — check Secrets.xcconfig.")
    }
    return key
}()

let supabase = SupabaseClient(
  supabaseURL: supabaseURL,
  supabaseKey: supabaseKey
)
