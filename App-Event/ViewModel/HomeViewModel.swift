//
//  HomeViewModel.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import UIKit

class HomeViewModel {
    
    private var listName: [String] = ["Evento Backfront", "Evento Andre", "Evento Qualquer", "Evento iOS", "Evento Apple AAcadamy","Evento Backfront", "Evento Andre", "Evento Qualquer", "Evento iOS", "Evento Apple AAcadamy","Evento Backfront", "Evento Andre", "Evento Qualquer", "Evento iOS", "Evento Apple AAcadamy"]
    
    public func getList(index: Int) -> String {
        listName[index]
    }
}
