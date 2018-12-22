//
//  BreakfastTableViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/12/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class BreakfastTableVC: UITableViewController, AddRecipeDelegate {
    
    // MARK: Vars
    var breakfastList: Array<Dish> = Array()
    
    // MARK: funcs
    
    // MARK: Protocols
    func newRecipeAdded(newDish: Dish) {
        self.breakfastList.append(newDish)
        storeData()
    }
    
    // MARK: IBACtions
    @IBAction func addNewRecipe(_ sender: UIBarButtonItem) {
        print("here: Inside addNewRecipe Button")
        self.performSegue(withIdentifier: "addNewRecipe", sender: nil)
    }
    
    
    // MARK: Sytems Funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad from BreakfastTableVC")
        getData()
        // testing
        /*
        var ingredientTest = ""
        ingredientTest += "Butter \n"
        ingredientTest += "2 pieces of your favorite bread"
        
        let sandwich = Dish()
        sandwich.nameRecipe = "Butter Sandwich"
        sandwich.instructions = "Spread the butter to the pieces of bread"
        sandwich.ingredients = ingredientTest
        self.breakfastList.append(sandwich)
        */
    
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear from BreakfastTableVC")
        self.tableView.reloadData()
        //getData()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear from BreakfastTableVC")
        storeData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.breakfastList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreakfastCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = self.breakfastList[indexPath.row].nameRecipe
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = self.breakfastList[indexPath.row]
        self.performSegue(withIdentifier: "RecipeSegue", sender: recipe)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            breakfastList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            storeData()
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "RecipeSegue" {
            let auxRecipe = sender as! Dish
            let recipeView:RecipeVC = segue.destination as! RecipeVC
            recipeView.dish = auxRecipe
        }
        
        if segue.identifier == "addNewRecipe" {
            print("here: Inside addNewRecipe segue")
            let auxAddRecipeView:AddingRecipeVC = segue.destination as! AddingRecipeVC
            auxAddRecipeView.addDelegate = self
        }
    }


    
    
    // MARK: Saving Data
    
    // storing app data
    func storeData() {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: breakfastList)
        userDefaults.set(encodedData, forKey: "breakfastListSaved")
        userDefaults.synchronize()
    }

    
    // getting app adata
    func getData() {
        let userDefaults = UserDefaults.standard
        
        if  let data = userDefaults.object(forKey: "breakfastListSaved") {
            let datas = data as! Data
            let decodedBreakfastList = NSKeyedUnarchiver.unarchiveObject(with: datas) as! [Dish]
            print("Count:  \(decodedBreakfastList.count)")
            self.breakfastList = decodedBreakfastList
        } else {
            print("No data found for key: breakfastListSaved")
        }
    }

}
