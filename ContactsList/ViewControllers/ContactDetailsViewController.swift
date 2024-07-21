//
//  ContactDetailsViewController.swift
//  ContactsList
//
//  Created by Alexey on 20.07.2024.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

}

extension ContactDetailsViewController {
    private func updateUI() {
        nameLabel.text = contact.name
        surnameLabel.text = contact.surname
    }
}
