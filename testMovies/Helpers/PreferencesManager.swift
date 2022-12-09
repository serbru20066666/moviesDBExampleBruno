//
//  PreferencesManager.swift
//
//  Created by Bruno Cardenas Torres.
//

import Foundation

class PreferencesManager {

    
    private static let TokenKey = "Token"
   
    
    static var Token: String {
       get{
           if let valor = UserDefaults.standard.string(forKey: TokenKey) {
               return valor
           }else{
               return ""
           }
       }
       set{
           UserDefaults.standard.set(newValue, forKey: TokenKey)
       }
    }
    
    private static let userNameKey = "userName"
   
    
    static var userName: String {
       get{
           if let valor = UserDefaults.standard.string(forKey: userNameKey) {
               return valor
           }else{
               return ""
           }
       }
       set{
           UserDefaults.standard.set(newValue, forKey: userNameKey)
       }
    }
    
  
    
}

