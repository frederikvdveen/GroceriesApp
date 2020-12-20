//
//  Extensions.swift
//  Einkaufsliste
//
//  Created by Jan van der Veen on 20.12.20.
//

import Foundation

extension Double {
    func roundedToPlaces(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
                return (self * divisor).rounded() / divisor
    }
}
