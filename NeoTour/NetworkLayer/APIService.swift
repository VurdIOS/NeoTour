//
//  APIService.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "")!
    
    func apiToGetData(completion : @escaping (Onboarding) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let data = try! jsonDecoder.decode(Onboarding.self, from: data)
                    completion(data)
            }
        }.resume()
    }
}
