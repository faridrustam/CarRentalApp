//
//  CarModel.swift
//  CarRentalApp
//
//  Created by Farid Rustamov on 23.12.24.
//

import Foundation

struct CategoryModel {
    let segment: String?
    let image: String?
    let carCount: String?
}

struct CarModel {
    let category: CategoryModel?
    let carName: String?
    let carModel: String?
    let engine: String?
    let price: String?
    let image: String?
}
