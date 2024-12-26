//
//  CoreDataCategory.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//

import Foundation

class CategoryCoreData {
    
    let context = AppDelegate().persistentContainer.viewContext
    var categoryItems = [CategoryList]()
    let userDefaultsManager = UserDefaultsManager()
    
    func fetchData(completion: (() -> Void)? = nil) {
        do {
            try categoryItems = context.fetch(CategoryList.fetchRequest())
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(categoryModel: CategoryModel) {
        let model = CategoryList(context: context)
        
        model.segment = categoryModel.segment
        model.image = categoryModel.image
        model.carCount = categoryModel.carCount
        
        do {
            try context.save()
//            fetchData()
            self.userDefaultsManager.setValue(value: true, key: .saved)
        } catch {
            print(error.localizedDescription)
        }
    }
}
