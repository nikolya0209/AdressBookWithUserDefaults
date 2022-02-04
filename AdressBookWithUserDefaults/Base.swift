//
//  Base.swift
//  AdressBookWithUserDefaults
//
//  Created by MacBookPro on 04.02.2022.
//

import Foundation

class Base {
    
    static let shared = Base()
    
    let defaults = UserDefaults.standard
    struct UserAdress: Codable {
        var name: String
        var city: String
        var street: String
        var house: String
        var build: String?
        var flat: String
        var description: String {
            "\(name)- \(city), \(street), \(house), \(build ?? ""), \(flat)"
        }
    }
    
    var adresses: [UserAdress] {
        get {
            if let data = defaults.value(forKey: "adresses") as? Data {
                return try! PropertyListDecoder().decode([UserAdress].self, from: data)
            } else {
                return [UserAdress]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "adresses")
            }
        }
    }
    
    func saveAdress(name: String, city: String, street: String, house: String, build: String?, flat: String) {
        let adress = UserAdress(name: name, city: city, street: street, house: house, build: build, flat: flat)
        adresses.insert(adress, at: 0)
    }
}


