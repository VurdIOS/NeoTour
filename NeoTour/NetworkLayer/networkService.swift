////
////  APIService.swift
////  NeoTour
////
////  Created by Камаль Атавалиев on 13.02.2024.
////

import UIKit

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    private init() { }
    
    func fetchTour(completion: @escaping (Result<ToursData, Error>) -> Void) {
        guard let url = URL(string: "https://24984e72-d172-4aff-8886-bd0f5b8d3c2b.mock.pstmn.io/tourscopy") else {
            let error = NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("egfkb")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                print("decode")
                let decoder = JSONDecoder()
                let tours = try decoder.decode(ToursData.self, from: data)
                completion(.success(tours))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
     func fetchImage(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
         guard let imageUrl = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Image data could not be decoded", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    
    func fetchCategory(apiType: NetworkAPI, completion: @escaping (Result<[Tour], Error>) -> Void) {
        guard let url = apiType.components.url else {
            let error = NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode([Tour].self, from: data)
                completion(.success(categories))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func postRequest(apiType: NetworkAPI, postData: Data, completion: @escaping (Result<SomeResponseType, Error>) -> Void) {
        guard let url = apiType.components.url else {
            completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SomeResponseType.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkAPI {
    case tours, categories
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "example.com"
        components.path = "/api/path"
        return components
    }
}

struct SomeResponseType: Decodable {
}
