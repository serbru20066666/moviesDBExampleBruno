
//
//  Created by bruno cardenas on 5/12/20.
//  Copyright © 2020 Bruno C. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService {
    
    
    public var headers = [ "Content-Type":"application/json"]
    
    var urlRequested = ""
    var httpMethodRequested:HTTPMethod? = nil
    var paramsRequested:Parameters? = nil
    var headersRequested:HTTPHeaders? = nil
    
    
    
    class DefaultAlamofireSession: Alamofire.Session {
        static let shared: DefaultAlamofireSession = {
            let configuration = URLSessionConfiguration.default
            configuration.headers = .default
            configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
            configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
            configuration.requestCachePolicy = .useProtocolCachePolicy

            return DefaultAlamofireSession(configuration: configuration)
 
        }()
    }
    
    private static var sharedApiManager: ApiService = {
        let apiManager = ApiService(sessionManager: Session())
        
        return apiManager
    }()
    
    // MARK: - Accessors
    class func shared() -> ApiService {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    
    private init(sessionManager: Session) {
        self.headers = [ "Content-Type":"application/json"]
        
    }
    
    func request(_ url: String, httpMethod: HTTPMethod, params : Parameters?, headers: HTTPHeaders?, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        DefaultAlamofireSession.shared.request(url, method: httpMethod, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            self.urlRequested = url
            self.paramsRequested = params
            self.headersRequested = headers
            self.httpMethodRequested = httpMethod
            
            switch response.result {
            case .success:
                if let data = response.data, let json = try? JSON.init(data: data) {
                    
                    self.showRequestAndResponse(url, headers?.dictionary, params, json)
                    if let unwrappedResponse = response.response {
                        let statusCode = unwrappedResponse.statusCode
                        completion(.success(json))
                    }
                }
            case .failure(let error):
                if let unwrappedResponse = response.response {
                    let statusCode = unwrappedResponse.statusCode
                    
                    
                    if statusCode == 401
                    {
                        DefaultAlamofireSession.shared.cancelAllRequests()
                        
                    }
                    else
                    {
                        completion(.failure(error))
                    }
                    
                }
                
            }
            
        }
        
    }

    func showRequestAndResponse(_ url: String,_ headerss: [String : Any]?, _ params: [String : Any]?, _ json: JSON?){
        
        print("URL: \(url)")
        
        if let request = params?.prettyPrintedJSON {
            print("REQUEST: \(request)")
        }
        
        if let headers = headerss?.prettyPrintedJSON {
            print("HEADERS: \(headers)")
        }
        
        if let response = json {
            print("RESPONSE: \(response)")
        }
    }
    
    // MARK: - Customs Calls Service
    
        func Login(_ params: Parameters ,_ completion: @escaping (Result<JSON, Error>) -> Void){
            request(Constants.Login, httpMethod: .post, params: params, headers: HTTPHeaders(self.headers), completion: completion)
        }
    
    func RequestToken(_ completion: @escaping (Result<JSON, Error>) -> Void){
        let url = Constants.RequestAccesToken
        request(url, httpMethod: .get, params: nil, headers: HTTPHeaders(self.headers), completion: completion)
    }
    
    func PopularMovies(categorie:Int, _ completion: @escaping (Result<JSON, Error>) -> Void){
        var url = ""
        if categorie == Constants.categories.popular
        {
            url = Constants.PopularMovies
        }
        if categorie == Constants.categories.topRated
        {
            url = Constants.TopRated
        }
        if categorie == Constants.categories.Upcoming
        {
            url = Constants.Upcoming
        }
        if categorie == Constants.categories.now_playing
        {
            url = Constants.now_playing
        }


        request(url, httpMethod: .get, params: nil, headers: HTTPHeaders(self.headers), completion: completion)
    }

}
extension Dictionary {
    var prettyPrintedJSON: String? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch _ {
            return nil
        }
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
