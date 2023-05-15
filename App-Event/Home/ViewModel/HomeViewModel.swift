
import UIKit

class HomeViewModel {
    
    func getEvents(completion: @escaping ([Evento]) -> Void) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else {
        
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Erro desconhecido")
                
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
            
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error = error {
                    print("Erro ao baixar a imagem: \(error.localizedDescription)")
                    
                }

                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                    
                } else {
                    let defaultImage = UIImage(named: "default")!
                    completion(defaultImage)
                }
            }.resume()
        }
    }
}







