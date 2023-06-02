
import UIKit

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private var homeScreen: HomeScreen?
    private var homeViewModel: HomeViewModel = HomeViewModel()
    var receivedEvents: [Evento] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgrounsColor()
        configureTableView()
        addEvent()
    }
    
    private func configBackgrounsColor() {
        view.backgroundColor = UIColor.lightGray
    }
    
    private func configureTableView() {
        homeScreen?.configProtocolTableView(delegate: self, dataSource: self)
    }
    
    private func addEvent() {
        homeViewModel.getEvents { eventos in
            self.receivedEvents = eventos
            
            DispatchQueue.main.async {
                self.homeScreen?.tableView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receivedEvents.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
              return UITableViewCell()
          }
        cell.setupCell(model: receivedEvents[indexPath.row])
        cell.delegate(delegate: self)
        cell.selectionStyle = .none
        cell.acessarButton.row = indexPath.row
        homeViewModel.getImage(image: receivedEvents[indexPath.row].image, into: cell.imageOfEvent)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

extension HomeViewController: HomeCellProtocol {
    func tappedButton(row: Int) {
        let vc = InformationViewController()
        vc.eventModel = receivedEvents[row]
        vc.viewModel = homeViewModel
        navigationController?.pushViewController(vc , animated: true)
    }
}


