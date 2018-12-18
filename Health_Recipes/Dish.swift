//
//  Dish.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/16/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import Foundation

class Dish: NSObject, NSCoding {
    var nameRecipe: String
    var ingredients: String
    var instructions: String
    
    override init() {
        self.nameRecipe = ""
        self.ingredients = ""
        self.instructions = ""
    }
    
    init(name: String, ingredients: String, preparation:String) {
        self.nameRecipe = name
        self.ingredients = ingredients
        self.instructions = preparation
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameRecipe, forKey: "nameRecipe")
        aCoder.encode(ingredients, forKey: "ingredients")
        aCoder.encode(instructions, forKey: "instructions")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "nameRecipe") as! String
        let ingredients = aDecoder.decodeObject(forKey: "ingredients") as! String
        let preparation = aDecoder.decodeObject(forKey: "instructions") as! String
        self.init(name: name, ingredients: ingredients, preparation: preparation)
    }
    
    
}
