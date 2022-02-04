//
//  ViewController.swift
//  AdressBookWithUserDefaults
//
//  Created by MacBookPro on 03.02.2022.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var houseField: UITextField!
    @IBOutlet weak var buildField: UITextField!
    @IBOutlet weak var flatField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveAction(_ sender: Any) {
        let name = nameField.text!
        let city = cityField.text!
        let street = streetField.text!
        let house = houseField.text!
        let build = buildField.text!
        let flat = flatField.text!
        
        if !name.isEmpty && !city.isEmpty && !street.isEmpty && !house.isEmpty && !flat.isEmpty {
            Base.shared.saveAdress(name: name, city: city, street: street, house: house, build: build, flat: flat)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

