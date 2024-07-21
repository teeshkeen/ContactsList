//
//  Contact.swift
//  ContactsList
//
//  Created by Alexey on 20.07.2024.
//

struct Contact {
    let dataManager = DataManager()
    var name: String
    var surname: String
    
    var fullName: String {
        return "\(name) \(surname)"
    }
    
//    func getRandomData() -> Contact {
//        let contact = Contact(name: dataManager.names.randomElement() ?? "", surname: dataManager.surnames.randomElement() ?? "")
//        return contact
//    }
    
}
