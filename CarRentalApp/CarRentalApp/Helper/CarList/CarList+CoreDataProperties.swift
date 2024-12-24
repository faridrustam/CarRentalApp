//
//  CarList+CoreDataProperties.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 24.12.24.
//
//

import Foundation
import CoreData


extension CarList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarList> {
        return NSFetchRequest<CarList>(entityName: "CarList")
    }

    @NSManaged public var carName: String?
    @NSManaged public var category: String?
    @NSManaged public var engine: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var carModel: String?

}

extension CarList : Identifiable {

}
