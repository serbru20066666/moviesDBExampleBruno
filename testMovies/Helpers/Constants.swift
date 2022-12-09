//
//  Constants.swift
//  testMovies
//
//  Created by Bruno Cardenas on 24/02/21.
//

import Foundation
import SwiftUI
class Constants {

    static let apiKey = "e15be0b18f03a674d29e088615dd4081"
    static let urlBase = "https://api.themoviedb.org/3/"
    static let PopularMovies = urlBase + "movie/popular?api_key=" + apiKey
    static let TopRated = urlBase + "movie/top_rated?api_key=" + apiKey
    static let Upcoming = urlBase + "movie/upcoming?api_key=" + apiKey
    static let now_playing = urlBase + "movie/now_playing?api_key=" + apiKey
    static let urlImage = "https://image.tmdb.org/t/p/w200/imagePARAM?api_key=" + apiKey
    static let RequestAccesToken = urlBase + "authentication/token/new?api_key=" + apiKey
    static let Login = urlBase + "authentication/token/validate_with_login?api_key=" + apiKey
    
    
    
    static let nameApp = "Test Movies"
    static let greenApp = Color(UIColor(hexString: "01d277"))
    static let grayApp = Color(UIColor(hexString: "1F292D"))
    static let uiGrayApp = UIColor(hexString: "1F292D")
    
    
    struct categories {
        static let popular = 0
        static let topRated = 1
        static let Upcoming = 2
        static let now_playing = 3
    }
    
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
