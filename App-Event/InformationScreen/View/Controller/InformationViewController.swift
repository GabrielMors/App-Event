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
        view.backgroundColor = UIColor(red: 164/255, green: 170/255, blue: 193/255, alpha: 1)
    }
}
