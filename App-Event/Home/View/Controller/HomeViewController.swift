//
//  ViewController.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

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
        view.backgroundColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1)
    }
    
    private func configureTableView() {
        homeScreen?.configProtocolTableView(delegate: self, dataSource: self)
    }
    
    // A lista de eventos com um loop e adiciona cada evento à lista eventoRecebidos
    private func addEvent() {
        homeViewModel.getEvents { eventos in
            for evento in eventos {
                self.receivedEvents.append(evento)
            }
            //  garante que a atualização da interface do usuário seja feita na thread principal
            DispatchQueue.main.async {
                self.homeScreen?.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receivedEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
              fatalError("Deu ruim! não foi possível criar a célula")
          }
        cell.setupCell(model: receivedEvents[indexPath.row])
        cell.delegate(delegate: self)
        cell.selectionStyle = .none
        cell.acessarButton.row = indexPath.row
        homeViewModel.getImage(image: receivedEvents[indexPath.row].image) { image in
            DispatchQueue.main.async {
                cell.imageOfEvent.image = image
            }
        }
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


