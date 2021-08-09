//
//  NetworkController.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 08/08/2021.
//

import Foundation

class NetNetworkController {
    //class created for enumerations based on http method
    enum HTTPMethod: String {
        //if we are fetching it always the CAPITAL (details at postman.com)
        //put  = update
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        }
// 2 static func must be created -> to reuse in VC Class (PokemonVC)
// argument url with Type of URL
//more safe [String:Any]
// urlParams temporary assigned for nil
//Data? = nil assigned as nill as default one
    static func performRequest(for url: URL,
                               for httpMethod: HTTPMethod,
                               for urlParams: [String: String]? = nil,
                               for body: Data? = nil,
                               for completion: ((Data?, Error) ->Void)? = nil){
         
        //static func url need to be created before let requestURL
        
        let requestURL = self.url(byAdding: urlParams, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
    //    let dataTask = URLSession.shared.dataTask(with: request){ ( data, response, error) in
    //        completion?(data, error)
            
   //     }
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error ) in
            completion?(data, error)
        }
    }
    
    static func url(byAdding params: [String:String]?, to url:URL) -> URL {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = params?.compactMap{
            URLQueryItem(name: $0.key, value: $0.value)
            //$0 means Start $1 finish
        }
        
        guard let url = components?.url else {
            fatalError("URL components is nil")
        }
        return url
    }

    
}

