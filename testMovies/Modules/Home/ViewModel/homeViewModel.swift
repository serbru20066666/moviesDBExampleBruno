//
//  homeViewModel.swift
//  testMovies
//
//  Created by Bruno Cardenas on 28/02/21.
//

import Foundation
import Foundation
import SwiftUI
import Combine


class homeViewModel: ObservableObject {
    var didChange = PassthroughSubject<homeViewModel,Never>()
    @Published var selectedIndexCategories = Constants.categories.popular
    {
        didSet {
            changeIndex()
        }
    }
    @Published var movies:[Movie]?
    {
        didSet {
            didChange.send(self)
        }
    }
    
    func changeIndex()
    {
        wsLisPopularMovies()
    }
    
    init(){
        wsLisPopularMovies()
    }
    
    func  wsLisPopularMovies()  {
       
        ApiService.shared().PopularMovies(categorie: selectedIndexCategories) { (result) in
            
            
            switch result {
            case .success(let json):
                if let dict =  try? JSONDecoder().decode(listMovies.self, from: json.rawData())
                {
                    DispatchQueue.main.async {
                        self.movies = dict.results
                    }
                    
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
    

    
}
