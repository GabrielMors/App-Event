import UIKit
import Kingfisher
import Alamofire

class HomeViewModel {
    
    func getEvents(completion: @escaping ([Evento]) -> Void) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else {
            return
        }
        
        AF.request(url).validate().responseDecodable(of: [Evento].self) { response in
            switch response.result {
            case .success(let events):
                completion(events)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getImage(image: String, into imageView: UIImageView) {
        guard let imageUrl = URL(string: image) else {
            imageView.image = UIImage(named: "default")
            return
        }
        
        imageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "default"))
    }
}
