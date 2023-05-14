//
//  HomeViewModel.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import UIKit

class HomeViewModel {
    
    private var listName: [Evento] = []

    func numberOfRowsInSection() -> Int {
        listName.count
    }

    func getList(index: Int) -> Evento {
        listName[index]
    }
    
    func getEvents(completion: @escaping ([Evento]) -> Void) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else {
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                
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
                
            }
        }
        
        task.resume()
    }
    
    func getImage(image: String, completion: @escaping (UIImage) -> Void ) {
        
        if let imageUrl = URL(string: image) {
          // URLSession é uma classe
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    // Houve um erro ao fazer o download da imagem
                    print("Erro ao baixar a imagem: \(error.localizedDescription)")
                    
                }

                if let data = data, let image = UIImage(data: data) {
                    // O download da imagem foi concluído, você pode usar a imagem aqui
                    completion(image)
                    
                } else {
                    let defaultImage = UIImage(named: "default")!
                    completion(defaultImage)
                }
            }.resume()
        }
    }
    
    
}







