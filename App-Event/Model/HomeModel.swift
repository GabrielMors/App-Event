
import Foundation

// MARK: - Evento
class Evento: Codable {
    let people: [People]
    let date: Int
    let description: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String
    
    init(people: [People], date: Int, description: String, image: String, longitude: Double, latitude: Double, price: Double, title: String, id: String) {
        self.people = people
        self.date = date
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
        self.id = id
    }
}



class People: Codable {
    
}




