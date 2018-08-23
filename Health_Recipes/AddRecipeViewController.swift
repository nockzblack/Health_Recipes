//
//  addRecipeViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/23/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    // MARK: Vars
    let dish:Dish? = nil
    var previousViewController:UITableViewController? = nil
    
    // MARK: Funcs
    
    
    
    // MARK: IBOutlets
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var directionsTextField: UITextField!
    
    
    // MARK: IBActions
    @IBAction func addNewRecipe(_ sender: UIButton) {
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "backToBreakFastTableView" {
            
            
        }
        
        
        
    }
    

}
