//
//  InformationScreenViewController.swift
//  App-Event
//
//  Created by Gabriel Mors  on 10/05/23.
//

import UIKit

class InformationViewController: UIViewController {
    
    var infoScreen: InformationScreen?
    
    override func loadView() {
        infoScreen = InformationScreen()
        view = infoScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
}
