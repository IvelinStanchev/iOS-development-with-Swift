//
//  ChosenRecipeViewController.swift
//  Recipes
//
//  Created by Ivelin on 1/28/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit

class ChosenRecipeViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDetail: UITextView!
    @IBOutlet weak var recipeTimeToCook: UILabel!
    @IBOutlet weak var recipeFavouritesImage: UIImageView!
    
    var isFavourite: Bool = false
    var id: Int!
    var previous: RecipesTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ChosenRecipeViewController.tapDetected))
        singleTap.numberOfTapsRequired = 1 // you can change this value
        recipeFavouritesImage.isUserInteractionEnabled = true
        recipeFavouritesImage.addGestureRecognizer(singleTap)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateFavouritesImage()
        
        super.viewWillAppear(animated)
    }
    
    func updateFavouritesImage() {
        if isFavourite {
            recipeFavouritesImage.image = UIImage.init(named: "star_favourites_full.png")
        } else {
            recipeFavouritesImage.image = UIImage.init(named: "star_favourites_empty.png")
        }
    }
    
    //Action
    func tapDetected() {
        isFavourite = !isFavourite
        
        previous?.idOfChangedRecipe = id
        previous?.isFavouriteOfChangedRecipe = isFavourite
        
        updateFavouritesImage()
    }

}
