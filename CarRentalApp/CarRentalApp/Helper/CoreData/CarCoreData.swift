//
//  CoreData.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import Foundation

class CarCoreData {
    let context = AppDelegate().persistentContainer.viewContext
    var carItems = [CarList]()
    var callUI: (() -> Void)?
    
    func fetchData() {
        do {
            carItems = try context.fetch(CarList.fetchRequest())
            callUI?()
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
            fetchData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
