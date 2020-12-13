//
//  Wage.swift
//  WindowShopper
//
//  Created by Lucas Castelan Prado on 13-12-20.
//

import Foundation

struct Wage {
    static func getHours(hourlyWage: Double, itemPrice: Double) -> Int? {
        return hourlyWage == 0 ? nil : Int(ceil(itemPrice/hourlyWage))
     }
}
