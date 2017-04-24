
//
//  Food.swift
//  JsonDemo1
//
//  Created by Asif Ikbal on 4/24/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import Foundation


struct  FoodModel {
    
    var name: String
    var price: String
    var description: String
    var calories: Int
}

enum SerializationError : Error {
    case missing
    
}

extension FoodModel {
    
    init?(food: [String: String]) {
        guard let name = food["name"],
              let price = food["price"],
              let description = food["description"],
              let calories = food["calories"] else {
            return nil
        }
        
        self.name = name
        self.description = description
        self.price = price
        self.calories = Int(calories)!
        
    }
}
