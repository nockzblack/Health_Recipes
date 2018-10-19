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
    @IBOutlet weak var scrollView: UIScrollView!
    // TODO: Add many connections with interface builder
    
    

    // System Funcs

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.recipeTitleLabel.text = self.breakfast.nameRecipe
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollView.frame = self.view.frame;
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1800)
        // TODO: Adjust size with the bottom text area
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
