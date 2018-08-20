//
//  RecipeViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/20/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    // Vars
    var breakfast = Dish()
    
    // IBOutlets
    @IBOutlet weak var recipeTitleLabel: UILabel!
    

    // System Funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.recipeTitleLabel.text = self.breakfast.nameRecipe
        print("viewDidLoad from RecipeViewController")
        print(self.breakfast.nameRecipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
