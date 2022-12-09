//
//  token.swift
//  testMovies
//
//  Created by Bruno Cardenas on 28/02/21.
//

struct Tokenn: Codable {
    let success: Bool?
    let expiresAt, request_token, status_message: String?
    let status_code: Int?
}
