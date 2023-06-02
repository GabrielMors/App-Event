
import Foundation

// MARK: - Evento
struct Evento: Codable {
    let people: [People]
    let date: Int
    let description: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String
}

class People: Codable {
    
}




