
import UIKit

class InformationViewController: UIViewController {
    
    var infoScreen: InformationScreen?
    var viewModel: HomeViewModel?
    var eventModel: Evento?
    
    override func loadView() {
        infoScreen = InformationScreen()
        view = infoScreen
        viewModel?.getImage(image: eventModel?.image ?? "", completion: { image in
            DispatchQueue.main.async {
                self.infoScreen?.imageEvent.image = image
            }
        })
        infoScreen?.descriptionEvent.text = eventModel?.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1)
        
    }
    
    
    
    
}
