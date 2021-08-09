//
//  ImageController.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 08/08/2021.
//

import UIKit

class ImageController {
    
    static func getImage(for url: String, completion: @escaping(UIImage?) -> Void ) {
        
        guard let imageUrl = URL(string: url) else {
            fatalError("Could not create URL from this String\(url)")
        }
        NetworkController.performRequest(for: imageUrl, httpMethod: .get){
            (data, error) in
            guard let data = data,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            //will open a new thread, reloading to present it on the view
            DispatchQueue.main.async {
                completion(image)
                
            }
        }
    }
}
