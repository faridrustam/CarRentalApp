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
    
    func fetchData(completion: (() -> Void)? = nil) {
        do {
            try categoryItems = context.fetch(CategoryList.fetchRequest())
            completion?()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(categoryModel: CategoryList) {
        
        fetchData()
        do {
            try context.save()
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
            fetchData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
