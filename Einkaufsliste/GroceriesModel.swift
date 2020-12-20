//
//  GroceriesModel.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 20.12.20.
//

import Foundation

struct GrocerieItem: Hashable {
    var name: String
    var quantity: Double = 1.0
    var unit: String = ""
}

let products: Set = [""]
