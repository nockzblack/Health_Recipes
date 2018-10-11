//
//  addRecipeViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/23/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

//MARK: AddRecipe protocol
protocol AddRecipe: class {
    func newRecipeAdded(newDish: Dish)
}

class AddRecipeViewController: UIViewController {
    
    // MARK: Vars
    var dish:Dish? = nil
    weak var addDelegate:AddRecipe?
    
    // MARK: Funcs
    func createDish() {
        self.dish!.nameRecipe = recipeNameTextField.text!
        self.dish!.preparationIntructions = preparationTextView.text!
        let auxIngredient = Ingredient()
        auxIngredient.ingredientName = ingredientsTexView.text!
    }
    
    
    // MARK: IBOutlets
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var ingredientsTexView: UITextView!
    @IBOutlet weak var preparationTextView: UITextView!
    
    // TODO: Check the warning for autolayout
    
    
    
    // MARK: IBActions
    @IBAction func addNewRecipe(_ sender: UIButton) {
        createDish()
        addDelegate?.newRecipeAdded(newDish: self.dish!)
        print("Recipe Added. Yay!!")
        self.dismiss(animated: true, completion: nil)
        
        
        // TODO: return to the previous view controller, press the button Add Recipe
        
        
        // TODO: Make a ingredient per line in the ingredientsTextView
        
        
        // TODO: Add title to the view controller
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dish = Dish()
        // Do any additional setup after loading the view.
        self.ingredientsTexView.toolbarPlaceholder = "1 ingredient per line"
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
