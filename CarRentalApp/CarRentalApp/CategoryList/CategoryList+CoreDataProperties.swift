//
//  CategoryList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 22.12.24.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var segment: String?
    @NSManaged public var image: String?
    @NSManaged public var carCount: String?

}

extension CategoryList : Identifiable {

}
