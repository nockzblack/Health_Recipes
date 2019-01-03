//
//  DinnerTableVC.swift
//  Health_Recipes
//
//  Created by Fernando Benavides on 12/18/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class DinnerTableVC: UITableViewController, AddRecipeDelegate {
    
    // MARK: Vars
    var dinnerList: Array<Dish> = Array()
    
    
    // MARK: IBActions
    @IBAction func newDinnerAdded(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addNewRecipe", sender: nil)
    }
    
    
    // MARK: Protocols
    func newRecipeAdded(newDish: Dish) {
        self.dinnerList.append(newDish)
        storeData()
    }
    
    
    // MARK: System Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        /*
        // testing
         var ingredientTest = ""
         ingredientTest += "Butter \n"
         ingredientTest += "2 pieces of your favorite bread"
         
         let sandwich = Dish()
         sandwich.nameRecipe = "Butter Sandwich"
         sandwich.instructions = "Spread the butter to the pieces of bread"
         sandwich.ingredients = ingredientTest
         self.dinnerList.append(sandwich)
        */
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear from DinnerTableVC")
        self.tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear from DinnerTableVC")
        storeData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dinnerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DinnerCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = self.dinnerList[indexPath.row].nameRecipe
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = self.dinnerList[indexPath.row]
        self.performSegue(withIdentifier: "RecipeSegue", sender: recipe)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dinnerList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            storeData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      return .delete
    }
 
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
       return true
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedDish = self.dinnerList[fromIndexPath.row]
        self.dinnerList.remove(at: fromIndexPath.row)
        self.dinnerList.insert(movedDish, at: to.row)
        storeData()
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true // Return false if you do not want the item to be re-orderable.
    }
 
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
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
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: dinnerList)
        userDefaults.set(encodedData, forKey: "dinnerListSaved")
        userDefaults.synchronize()
    }
    
    
    // getting app adata
    func getData() {
        let userDefaults = UserDefaults.standard
        if let data = userDefaults.object(forKey: "dinnerListSaved") {
            let datas = data as! Data
            let decodedBreakfastList = NSKeyedUnarchiver.unarchiveObject(with: datas) as! [Dish]
            print("Count:  \(decodedBreakfastList.count)")
            self.dinnerList = decodedBreakfastList
        } else {
            print("No data")
        }
    }
 
}
