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
    }
    
    func setLoggedIn(value: Any, key: Keys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getLoggedIn(key: Keys = .login) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
