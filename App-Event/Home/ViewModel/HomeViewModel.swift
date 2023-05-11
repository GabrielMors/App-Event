//
//  HomeViewModel.swift
//  App-Event
//
//  Created by Gabriel Mors  on 07/05/23.
//

import UIKit

class HomeViewModel {
    
    private var listName: [Evento] = [Evento(name: "Evento Backfront", image: "person.fill"),Evento(name: "Evento Andre", image: "person.fill"),Evento(name: "Evento Qualquer", image: "person.fill"),Evento(name: "Evento iOS", image: "person.fill"),Evento(name: "Evento Apple AAcadamy", image: "person.fill"),Evento(name: "Evento Backfront", image: "person.fill"),Evento(name: "Evento Backfront", image: "person.fill"),Evento(name: "Evento Andre", image: "person.fill"),Evento(name: "Evento Qualquer", image: "person.fill"),Evento(name: "Evento iOS", image: "person.fill"),Evento(name: "Evento Apple AAcadamy", image: "person.fill"),Evento(name: "Evento Backfront", image: "person.fill")]

    
    public func numberOfRowsInSection() -> Int {
        listName.count
    }
    
    public func getList(index: Int) -> Evento {
        listName[index]
    }
    
}
