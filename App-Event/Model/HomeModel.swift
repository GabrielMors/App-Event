//
//  HomeModel.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import Foundation

struct Evento {
    var name: String
    var image: String
}





//struct Evento {
//
//    struct Event: Codable {
//        let id: String
//        let name: String
//        let date: String
//        let location: String
//    }
//
//    class EventAPI {
//        static let shared = EventAPI()
//
//        private let baseURL = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
//
//        func getAllEvents(completion: @escaping (Result<[Event], Error>) -> Void) {
//            guard let url = URL(string: baseURL) else {
//                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let data = data else {
//                    completion(.failure(error ?? NSError(domain: "Unknown error", code: -1, userInfo: nil)))
//                    return
//                }
//
//                do {
//                    let events = try JSONDecoder().decode([Event].self, from: data)
//                    completion(.success(events))
//                } catch {
//                    completion(.failure(error))
//                }
//            }.resume()
//        }
//    }
//
//}
