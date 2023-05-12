//
//  ViewController.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolTableView(delegate: self, dataSource: self)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
        cell?.setupCell(model: viewModel.getList(index: indexPath.row))
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

extension HomeViewController: HomeCellProtocol {
    func tappedButton() {
        print("cliquei no botao")
    }
    
    
}


