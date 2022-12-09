//
//  movies.swift
//  testMovies
//
//  Created by Bruno Cardenas on 26/02/21.
//


import Foundation

// MARK: - listMovies
struct listMovies: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let poster_path, release_date, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?


}
