//
//  APIService.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//

//
import Foundation
//
//final class NetworkLayer {
//
//    static let shared = NetworkLayer()
//
//    private init() { }
//
//    // Функция для выполнения GET запроса и получения туров
//    func fetchTour(apiType: NetworkAPI, completion: @escaping (Result<[ToursData], Error>) -> Void) {
//        guard let url = apiType.components.url else {
//            let error = NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
//            completion(.failure(error))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let tours = try decoder.decode([ToursData].self, from: data)
//                completion(.success(tours))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
//    // Функция для выполнения GET запроса и получения категорий
//    func fetchCategory(apiType: NetworkAPI, completion: @escaping (Result<[Tour], Error>) -> Void) {
//        guard let url = apiType.components.url else {
//            let error = NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
//            completion(.failure(error))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let categories = try decoder.decode([Tour].self, from: data)
//                completion(.success(categories))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
//    // Заготовка для POST запроса
//    func postRequest(apiType: NetworkAPI, postData: Data, completion: @escaping (Result<SomeResponseType, Error>) -> Void) {
//        guard let url = apiType.components.url else {
//            completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = postData
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
//                return
//            }
//
//            do {
//                let response = try JSONDecoder().decode(SomeResponseType.self, from: data)
//                completion(.success(response))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
//
//// Предполагаемые структуры и enum для демонстрации
//enum NetworkAPI {
//    case tours, categories
//
//    var components: URLComponents {
//        // Здесь должна быть логика для создания URLComponents в зависимости от типа запроса
//        var components = URLComponents()
//        // Пример заполнения
//        components.scheme = "https"
//        components.host = "example.com"
//        components.path = "/api/path"
//        // И так далее в зависимости от случая
//        return components
//    }
//}
//
//struct SomeResponseType: Decodable {
//    // Структура для ответа POST запроса
//}
