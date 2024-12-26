//
//  CarListArray.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 23.12.24.
//

import Foundation

class CarsData {
    
    let categoryData = CategoryCoreData()
    let carData = CarDetailCoreData()
    
    func saveData() {
        
        //CategoryList
        
        let standardCategory = CategoryModel(segment: "Standard", image: "standard", carCount: "3")
        categoryData.saveData(categoryModel: standardCategory)
        
        let economyCategory = CategoryModel(segment: "Economy", image: "economy", carCount: "2")
        categoryData.saveData(categoryModel: economyCategory)
        
        let prestigeCategory = CategoryModel(segment: "Prestige", image: "prestige", carCount: "4")
        categoryData.saveData(categoryModel: prestigeCategory)
        
        let suvCategory = CategoryModel(segment: "SUV", image: "suv", carCount: "3")
        categoryData.saveData(categoryModel: suvCategory)
        
        //CarList

        let standardCar1 = CarModel(category: standardCategory, carName: "Toyota", carModel: "Corolla", engine: "4-Cyl 1.5 Liter", price: "350$", image: "standard")
        carData.saveData(carModel: standardCar1)
        
        let standardCar2 = CarModel(category: standardCategory, carName: "Chevrolet", carModel: "Aveo", engine: "2-Cyl 4.0 Liter", price: "250$", image: "standard")
        carData.saveData(carModel: standardCar2)
        
        let standardCar3 = CarModel(category: standardCategory, carName: "Ford", carModel: "Crown", engine: "2-Cyl 3.0 Liter", price: "200$", image: "standard")
        carData.saveData(carModel: standardCar3)
        
        let economyCar1 = CarModel(category: economyCategory, carName: "Ford", carModel: "Focus", engine: "4-Cyl 1.5 Liter", price: "150$", image: "economy")
        carData.saveData(carModel: economyCar1)
        
        let economyCar2 = CarModel(category: economyCategory, carName: "Audi", carModel: "A4", engine: "2-Cyl 2.0 Liter", price: "100$", image: "economy")
        carData.saveData(carModel: economyCar2)
        
        let prestigeCar1 = CarModel(category: prestigeCategory, carName: "BMW", carModel: "X5", engine: "4-Cyl 2.0 Liter", price: "650$", image: "prestige")
        carData.saveData(carModel: prestigeCar1)
        
        let prestigeCar2 = CarModel(category: prestigeCategory, carName: "Mercedes Benz", carModel: "GLE", engine: "4-Cyl 2.0 Liter", price: "700$", image: "prestige")
        carData.saveData(carModel: prestigeCar2)

        let prestigeCar3 = CarModel(category: prestigeCategory, carName: "Audi", carModel: "Q3", engine: "4-Cyl 2.0 Liter", price: "550$", image: "prestige")
        carData.saveData(carModel: prestigeCar3)

        let prestigeCar4 = CarModel(category: prestigeCategory, carName: "BMW", carModel: "X3", engine: "4-Cyl 2.0 Liter", price: "600$", image: "prestige")
        carData.saveData(carModel: prestigeCar4)
        
        let suvCar1 = CarModel(category: suvCategory, carName: "Jeep", carModel: "Quadrado", engine: "4-Cyl 1.5 Liter", price: "450$", image: "suv")
        carData.saveData(carModel: suvCar1)

        let suvCar2 = CarModel(category: suvCategory, carName: "Hyundai", carModel: "Santa Fe", engine: "2-Cyl 4.0 Liter", price: "550$", image: "suv")
        carData.saveData(carModel: suvCar2)

        let suvCar3 = CarModel(category: suvCategory, carName: "Range Rover", carModel: "Sport", engine: "2-Cyl 3.0 Liter", price: "800$", image: "suv")
        carData.saveData(carModel: suvCar3)
    }
}
