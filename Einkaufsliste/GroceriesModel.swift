//
//  GroceriesModel.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 20.12.20.
//

import Foundation

struct GrocerieItem: Hashable {
    var name: String
    var quantity: Int = 1
    var unit: Unit = .piece
    
}

enum Unit {
    case piece
    case weight
    case liter
    case tsp
}
