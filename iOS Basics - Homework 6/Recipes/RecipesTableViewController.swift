//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Ivelin on 1/28/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit



class RecipesTableViewController: UITableViewController {

    //Comment: I haven't used any save and get from DB functionalities since it
    //wasn't said in the homework specification and it's not the purpose of the homework. If you open the app, the data you have
    //changed before will not be saved.
    
    @IBOutlet var allRecipesTable: UITableView!
    var inputData : [DishModel] = [
        DishModel(id: 1, image: UIImage(named: "addictive_sesame_chicken.jpg"), name: "Addictive Sessame Chicken", timeToCook: 50, recipeText: "Combine the 2 tablespoons soy sauce, the dry sherry, dash of sesame oil, flour, 2 tablespoons cornstarch, 2 tablespoons water, baking powder, baking soda, and canola oil in a large bowl. Mix well; stir in the chicken. Cover and refrigerate for 20 minutes." + "Heat oil in a deep-fryer or large saucepan to 375 degrees F (190 degrees C). Combine the 1/2 cup water, chicken broth, vinegar, 1/4 cup cornstarch, sugar, 2 tablespoons soy sauce, 2 tablespoons sesame oil, red chili paste, and garlic in a small saucepan. Bring to a boil, stirring constantly. Turn heat to low and keep warm, stirring occasionally. Fry the marinated chicken in batches until cooked through and golden brown, 3 to 5 minutes. Drain on paper towels. Transfer the chicken to a large platter, top with sauce, and sprinkle with sesame seeds."),
        DishModel(id: 2, image: UIImage(named: "slow_cooker_salisbury_steak.jpg"), name: "Slow Cooker Salisbury Steak", timeToCook: 315, recipeText: "In a large bowl, mix together the ground beef, onion soup mix, bread crumbs, and milk using your hands. Shape into 8 patties. Heat the oil in a large skillet over medium-high heat. Dredge the patties in flour just to coat, and quickly brown on both sides in the hot skillet. Place browned patties into the slow cooker stacking alternately like a pyramid. In a medium bowl, mix together the cream of chicken soup, au jus mix, and water. Pour over the meat. Cook on the Low setting for 4 or 5 hours, until ground beef is well done."),
        DishModel(id: 3, image: UIImage(named: "sausage_potato_kale_soup.jpg"), name: "Sausage, Potato and Kale Soup", timeToCook: 60, recipeText: "Heat a large soup pot over medium-high heat. Crumble sausage into pot; cook and stir until browned, about 10 minutes. Drain and discard grease. Stir half-and-half, potatoes, chicken broth, milk, onion, oregano, and red pepper flakes into sausage, bring to a boil, and reduce heat to low. Simmer until potatoes are tender, about 30 minutes. Season with black pepper; stir kale into soup. Simmer until kale is tender, 10 to 15 more minutes."),
        DishModel(id: 4, image: UIImage(named: "maryland_crab_cakes.jpg"), name: "Maryland Crab Cakes II", timeToCook: 35, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 5, image: UIImage(named: "chicken_and_ham_casserole.jpg"), name: "Chicken and Ham Casserole", timeToCook: 45, recipeText: "Preheat oven to 400 degrees F (200 degrees C). Melt butter in a large saucepan over low heat. Stir in the flour and heat until bubbly. Slowly add the milk, stirring constantly, until mixture is thickened and smooth. Remove from heat and stir in the chicken, ham, noodles, celery, salt and ground black pepper. Transfer this mixture to a 1 1/2 quart casserole dish. Bake at 400 degrees F (200 degrees C) for 15 minutes. Remove from oven, sprinkle with the cheese and top with paprika, as desired. Return to oven and bake for 5 to 10 minutes, or until cheese is bubbly."),
        DishModel(id: 6, image: UIImage(named: "slow_cooker_beef_pot_roast.jpg"), name: "Slow Cooker Beef Pot Roast", timeToCook: 35, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 7, image: UIImage(named: "triple_dipped_fried_chicken.jpg"), name: "Triple Dipped Fried Chicken", timeToCook: 35, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 8, image: UIImage(named: "roast_sticky_chicken_rotisserie_style.jpg"), name: "Roast Sticky Chicken Rotisserie Style", timeToCook: 135, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 9, image: UIImage(named: "cabbage_rolls.jpg"), name: "Cabbage Rolls", timeToCook: 30, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 10, image: UIImage(named: "baked_spaghetti.jpg"), name: "Baked Spaghetti", timeToCook: 45, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 11, image: UIImage(named: "oven_baked_chicken_teriyaki.jpg"), name: "Oven Baked Chicken Teriyaki", timeToCook: 35, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 12, image: UIImage(named: "caramelized_baked_chicken.jpg"), name: "Caramelized Baked Chicken", timeToCook: 60, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 13, image: UIImage(named: "healthier_sow_cooker_chicken_tortilla_soup.jpg"), name: "Healthier Sow Cooker Chicken Tortilla Soup", timeToCook: 40, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 14, image: UIImage(named: "cabbage_fat_burning_soup.jpg"), name: "Cabbage Fat Burning Soup", timeToCook: 115, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown."),
        DishModel(id: 15, image: UIImage(named: "waikiki_meatballs.jpg"), name: "Waikiki Meatballs", timeToCook: 20, recipeText: "Preheat oven broiler. Mix together crabmeat, bread crumbs, parsley, salt and pepper. Beat together egg, mayonnaise, hot sauce and mustard. Combine with other ingredients and mix well. Form into patties and place on a lightly greased broiler pan or baking sheet. Broil for 10 to 15 minutes, until lightly brown.")
        ]
    
    var favourites: [DishModel] = Array()
    //changed from chosen recipe
    var idOfChangedRecipe: Int?
    var isFavouriteOfChangedRecipe: Bool?
    
    override func viewDidLoad() {
        updateFavourites()
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateFavourites()
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateFavourites() {
        var counter = 0
        for recipe in inputData {
            if recipe.id == idOfChangedRecipe {
                inputData[counter].isFavourite = isFavouriteOfChangedRecipe
            }
            
            counter += 1
        }
        
        favourites.removeAll()
        
        for recipe in inputData {
            if recipe.isFavourite == true {
                favourites.append(recipe)
            }
        }
        
        //sort the recipes by clicks count in descending order
        inputData = inputData.sorted(by: { $0.clicksCount > $1.clicksCount })
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if favourites.count > 0 {
            return 2
        }
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 && favourites.count > 0 {
            return self.favourites.count
        } else {
            return self.inputData.count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 && favourites.count > 0 {
            return "Favourites"
        } else  {
            return "All Recipes"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllRecipesCell", for: indexPath)

        // Configure the cell
        
        if indexPath.section == 0 && favourites.count > 0 {
            //favourites
            cell.textLabel?.text = favourites[indexPath.row].name
            cell.detailTextLabel?.text = "Time to cook: " + String(favourites[indexPath.row].timeToCook) + " minutes"
            cell.imageView?.image = favourites[indexPath.row].image
        } else {
            //all recipes
            cell.textLabel?.text = inputData[indexPath.row].name
            cell.detailTextLabel?.text = "Time to cook: " + String(inputData[indexPath.row].timeToCook) + " minutes"
            cell.imageView?.image = inputData[indexPath.row].image
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let chosenRecipeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChosenRecipeViewController")
//        self.navigationController?.pushViewController(chosenRecipeViewController, animated: true)
        self.performSegue(withIdentifier: "ChoseRecipeSegue", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ChosenRecipeViewController {
            let destination = segue.destination as! ChosenRecipeViewController
            
            destination.loadViewIfNeeded()
            
            let indexPath = sender as! IndexPath
            let rowIndex = indexPath.row
            
            var name: String?
            var image: UIImage?
            var timeToCook: Int?
            var details: String?
            var isFavourite = false
            var id: Int!
            
            if indexPath.section == 0 && favourites.count > 0 {
                name = favourites[rowIndex].name
                image = favourites[rowIndex].image
                timeToCook = favourites[rowIndex].timeToCook
                details = favourites[rowIndex].recipeText
                isFavourite = true
                id = favourites[rowIndex].id
            } else {
                inputData[rowIndex].clicksCount! += 1
                
                name = inputData[rowIndex].name
                image = inputData[rowIndex].image
                timeToCook = inputData[rowIndex].timeToCook
                details = inputData[rowIndex].recipeText
                isFavourite = inputData[rowIndex].isFavourite
                id = inputData[rowIndex].id
            }
            
            destination.recipeTitle?.text = name ?? ""
            destination.recipeImage?.image = image
            destination.recipeTimeToCook?.text = "Time to cook: " + String(timeToCook!) + " minutes"
            destination.recipeDetail?.text = details ?? ""
            destination.isFavourite = isFavourite
            destination.id = id
            destination.previous = self
        }
    }

}
