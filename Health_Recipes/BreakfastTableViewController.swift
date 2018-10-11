//
//  BreakfastTableViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/12/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class BreakfastTableViewController: UITableViewController, AddRecipe {
    
    
    // MARK: Vars
    var breakfastList: Array<Dish> = Array()
    
    // MARK: funcs
    
    // MARK: IBOutlet
    
    // MARK: Protocols
    func newRecipeAdded(newDish: Dish) {
        self.breakfastList.append(newDish)
    }
    
    // MARK: IBACtions
    
    @IBAction func addNewRecipe(_ sender: UIBarButtonItem) {
        print("here: Inside addNewRecipe Button")
        self.performSegue(withIdentifier: "addNewRecipe", sender: nil)
    }
    
    
    // MARK: Sytems Funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // testing
        let auxDish = Dish()
        auxDish.nameRecipe = "Sandwich"
        
        let quesadilla = Dish()
        quesadilla.nameRecipe = "Quesadilla"
        
        self.breakfastList.append(auxDish)
        self.breakfastList.append(quesadilla)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        print("viewDidLoad from BreakfastTablewView")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear from BreakfastTablewView")
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "RecipeSegue" {
            let auxRecipe = sender as! Dish
            let recipeView:RecipeViewController = segue.destination as! RecipeViewController
            recipeView.breakfast = auxRecipe
        }
        
        if segue.identifier == "addNewRecipe" {
            print("here: Inside addNewRecipe segue")
            let auxAddRecipeView:AddRecipeViewController = segue.destination as! AddRecipeViewController
            auxAddRecipeView.addDelegate = self
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


}
