//
//  HomeViewModel.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import UIKit

import UIKit

class HomeViewModel {
    
    private var listName: [Evento] = []

    func numberOfRowsInSection() -> Int {
        listName.count
    }

    func getList(index: Int) -> Evento {
        listName[index]
    }
    
    func getEvents(completion: @escaping () -> Void) {
        let eventAPI = EventAPI()
        eventAPI.getEvents { [weak self] events in
            guard let events = events else { return }
            self?.listName = events
            completion()
        }
    }
}



class EventAPI {
    
    func getEvents(completion: @escaping ([Evento]?) -> Void) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            do {
                let events = try JSONDecoder().decode([Evento].self, from: data)
                completion(events)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        
        task.resume()
    }
}







