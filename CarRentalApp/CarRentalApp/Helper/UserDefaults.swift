//
//  UserDefaults.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 21.12.24.
//

import Foundation

class UserDefaultsManager {
    enum Keys: String, CaseIterable {
        case login = "loggedIn"
        case saved = "saved"
        case carSaved = "carSaved"
    }
    
    func setValue(value: Any, key: Keys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getValue(key: Keys = .login) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
