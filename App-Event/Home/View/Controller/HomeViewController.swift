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
    
    var homeScreen: HomeScreen?
    var viewModel: HomeViewModel = HomeViewModel()
    var eventoRecebidos: [Evento] = []
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgrounsColor()
        homeScreen?.configProtocolTableView(delegate: self, dataSource: self)
        requestAPI()
    }
    
    private func configBackgrounsColor() {
        view.backgroundColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1)
    }
    
// A lista de eventos com um loop e adiciona cada evento à lista eventoRecebidos
    private func requestAPI() {
        viewModel.getEvents { eventos in
            for evento in eventos {
                self.eventoRecebidos.append(evento)
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
        eventoRecebidos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
        cell?.setupCell(model: eventoRecebidos[indexPath.row])
        cell?.delegate(delegate: self)
        cell?.selectionStyle = .none
        cell?.acessarButton.row = indexPath.row
        viewModel.getImage(image: eventoRecebidos[indexPath.row].image) { image in
            DispatchQueue.main.async {
                cell?.imageOfEvent.image = image
            }
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

extension HomeViewController: HomeCellProtocol {
    func tappedButton(row: Int) {
        let vc = InformationViewController()
        vc.eventModel = eventoRecebidos[row]
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc , animated: true)
    }
}


