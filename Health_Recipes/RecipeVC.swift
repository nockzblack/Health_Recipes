//
//  RecipeViewController.swift
//  Health_Recipes
//
//  Created by Fernando Benavides Rodriguez on 8/20/18.
//  Copyright © 2018 Nockzblack. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: Vars
    var dish = Dish()
    var imagePickerController : UIImagePickerController!
    
    
    // MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recipeView: UIView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var preparationTextView: UITextView!
    @IBOutlet weak var recipePhotoImageView: UIImageView!
    
    
    // MARK: IBActions
    @IBAction func onTakePhoto(_ sender: UIButton) {
        imagePickerController = UIImagePickerController();
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    // MARK: Funcs
    func saveImage(imageName: String) {
        // create a instance of the file manager
        let fileManager = FileManager.default
        
        // get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        // get the image we took
        let image = recipePhotoImageView.image!
        
        // get the PNG data for this image
        let data = image.pngData()
        
        // store it int he document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
    func getImage(imageName: String) {
        // create a instance of the file manager
        let fileManager = FileManager.default
        
        // get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            recipePhotoImageView.image = UIImage(contentsOfFile: imagePath)
        } else {
            recipePhotoImageView.image = UIImage(named: "defaultImage.png")
            print("Image not found!!")
        }
    }
    
    
    // MARK: Delegates funcs
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        recipePhotoImageView.contentMode = .scaleToFill
        recipePhotoImageView.image = chosenImage
        saveImage(imageName: dish.nameRecipe)
    }
    
    
    // MARK: System Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dishNameLabel.text = self.dish.nameRecipe
        self.preparationTextView.text = self.dish.instructions
        self.ingredientsTextView.text = self.dish.ingredients
        getImage(imageName: dish.nameRecipe)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollView.frame = self.view.frame;
        //scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 1000)
        // TODO: Adjust size with the bottom text area
    }
    
}
