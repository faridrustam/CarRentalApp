//
//  CoreData.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import Foundation

class CarDetailCoreData {
    let context = AppDelegate().persistentContainer.viewContext
    var carItems = [CarList]()
    let userDefaultsManager = UserDefaultsManager()
    var callUI: (() -> Void)?
    
    func fetchData(completion: (() -> Void)?) {
        do {
            carItems = try context.fetch(CarList.fetchRequest())
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(carModel: CarModel) {
        let model = CarList(context: context)
        
        model.category = carModel.category?.segment
        model.carName = carModel.carName
        model.carModel = carModel.carModel
        model.engine = carModel.engine
        model.price = carModel.price
        model.image = carModel.image
        
        do {
            try context.save()
//            fetchData()
            userDefaultsManager.setValue(value: true, key: .carSaved)
        } catch {
            print(error.localizedDescription)
        }
    }
}
