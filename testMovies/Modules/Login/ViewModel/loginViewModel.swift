//
//  loginViewModel.swift
//  testMovies
//
//  Created by Bruno Cardenas on 25/02/21.
//


import Foundation
import SwiftUI
import Combine


class loginViewModel: ObservableObject {
    var didChange = PassthroughSubject<loginViewModel,Never>()
    @Published var userName = "serbru20066"
    @Published var password = "Picoro667788"
    @Published var msgError = ""
    @Published var mostrarAlerta = false
    @Published var goToHome = false
    @Published var response:Tokenn?
    {
        didSet {
            didChange.send(self)
        }
    }
    
    init(){
        wsRequesAccesToken()
    }
    
    func  wsLogin()  {
       
        let paramsss = [
            "username": userName,
            "password": password,
            "request_token": PreferencesManager.Token
        ]
        ApiService.shared().Login(paramsss) { (result) in
            
            
            switch result {
            case .success(let json):
                if let dict =  try? JSONDecoder().decode(Tokenn.self, from: json.rawData())
                {
                    DispatchQueue.main.async {
                        
                        if let msg = dict.status_message
                        {
                            self.mostrarAlerta = true
                            self.msgError = msg
                           
                        }
                        else
                        {
                            PreferencesManager.userName = self.userName
                            self.goToHome = true
                            
                        }
                        
                    }
                    
                }
                else
                {
                    
                }
                
            case .failure(let error):
                
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    public func wsRequesAccesToken()
    {
        
        ApiService.shared().RequestToken { (result) in
            
            
            switch result {
            case .success(let json):
                if let dict =  try? JSONDecoder().decode(Tokenn.self, from: json.rawData())
                {
                    DispatchQueue.main.async {
                        
                        if let msg = dict.status_message
                        {
                            self.msgError = msg
                        }
                        else
                        {
                            PreferencesManager.Token = dict.request_token ?? ""
                        }
                        
                    }
                    
                }
                
            case .failure(let error):
                
                print(error.localizedDescription)
            }
            
            
        }
    }
    
}

