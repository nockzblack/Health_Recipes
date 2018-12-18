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

class AddingRecipeVC: UIViewController {
    
    // MARK: Vars
    var dish:Dish? = nil
    weak var addDelegate:AddRecipe?
    
    // MARK: Funcs
    func createDish() {
        self.dish!.nameRecipe = recipeNameTextField.text!
        self.dish!.instructions = preparationTextView.text!
        self.dish!.ingredients = ingredientsTextView.text!
        print("Recipe Name: \(self.dish!.nameRecipe)")
        print("Ingredients: \(self.dish!.ingredients)")
        print("Instrucciones: \(self.dish!.instructions)")
    }
    
    
    // MARK: IBOutlets
    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var preparationTextView: UITextView!
    
    // TODO: Check the warning for autolayout
    
    
    
    // MARK: IBActions
    @IBAction func addNewRecipe(_ sender: UIButton) {
        if (recipeNameTextField.text!.isEmpty) || (ingredientsTextView.text!.isEmpty) || (preparationTextView.text!.isEmpty) {
            let alert = UIAlertController(title: "Error:", message: "There is empty fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OKAY, let me finish", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            createDish()
            addDelegate?.newRecipeAdded(newDish: self.dish!)
            print("Recipe Added. Yay!!")
            
            let alert = UIAlertController(title: "Yay!!", message: "New Recipe was added", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OKAY!", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dish = Dish() // init dish
        self.title = "Adding a Recipe" // titlo for the view
        self.ingredientsTextView.toolbarPlaceholder = "1 ingredient per line" // indiations for the keyboard input
        
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
