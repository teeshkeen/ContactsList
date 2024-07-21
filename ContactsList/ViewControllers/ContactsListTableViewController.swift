//
//  ContactsListTableViewController.swift
//  ContactsList
//
//  Created by Alexey on 20.07.2024.
//

import UIKit

class ContactsListTableViewController: UITableViewController {
    
    // properties
    let dataManager = DataManager()
    lazy var data = getData()
    var generatedContacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

// MARK: - methods

extension ContactsListTableViewController {
    
    
    // - private methods
    func getData() -> [Contact] {
        var surnames = dataManager.surnames
        var names = dataManager.names
        var contacts: [Contact] = []
        
        for (name, surname) in zip(names, surnames) {
            let newContact = Contact(name: name, surname: surname)
            contacts.append(newContact)
            
            surnames.remove(at: surnames.firstIndex(of: surname)!)
            names.remove(at: names.firstIndex(of: name)!)
        }
        return contacts
    }
    
    
    // - tableView override methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        
        let currentContact = data[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = currentContact.fullName
        
        cell.contentConfiguration = content
        
        generatedContacts.append(currentContact)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? ContactDetailsViewController else { return }
        detailsVC.contact = sender as? Contact
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC.contact = generatedContacts[indexPath.row]
    }

}
