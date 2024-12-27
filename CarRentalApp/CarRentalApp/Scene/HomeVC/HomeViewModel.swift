//
//  HomeViewModel.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 27.12.24.
//

import Foundation

class HomeViewModel {
    
    let carsData = CarsData()
    let carCoreData = CarDetailCoreData()
    let manager = CategoryCoreData()
    var categoryItems = [CategoryList]()
    var carItems = [CarList]()
    var filteredCars: [CarList] = []
    var searchedCars: [CarList] = []
    let userDefaultsManager = UserDefaultsManager()
    
    
    
    func getItems() {
        if !userDefaultsManager.getValue(key: .saved) && !userDefaultsManager.getValue(key: .carSaved)  {
            carsData.saveData()
        }
        manager.fetchData {
            self.categoryItems = self.manager.categoryItems
        }
        carCoreData.fetchData {
            self.carItems = self.carCoreData.carItems
        }
    }
    
    
}
