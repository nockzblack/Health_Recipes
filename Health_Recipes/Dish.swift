//
//  Dish.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/16/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import Foundation

class Dish {
    var nameRecipe: String
    var ingredients: Ingredients
    var preparationIntructions: String
    var totalCalories: Double
    var difulty:String
    
    init() {
        self.nameRecipe = ""
        self.ingredients = Ingredients()
        self.preparationIntructions = ""
        self.totalCalories = 0.0
        self.difulty = ""
    }
}