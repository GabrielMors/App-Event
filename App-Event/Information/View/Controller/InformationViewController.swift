import UIKit

class InformationViewController: UIViewController {
    
    var infoScreen: InformationScreen?
    var viewModel: HomeViewModel?
    var eventModel: Evento?
    
    override func loadView() {
        infoScreen = InformationScreen()
        view = infoScreen
        configureImage()
        configureDescription()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
    }
    
    private func configureBackground() {
        view.backgroundColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1)
    }
    
    private func configureImage() {
        guard let imageView = infoScreen?.imageEvent else {
            return
        }
        
        viewModel?.getImage(image: eventModel?.image ?? "", into: imageView)
    }
    
    private func configureDescription() {
        infoScreen?.descriptionEventLabel.text = eventModel?.description
    }
}
