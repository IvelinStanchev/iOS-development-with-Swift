//
//  File.swift
//  Recipes
//
//  Created by Ivelin on 1/28/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit
import Foundation

class DishModel : NSObject {
    
    var id: Int! = 0
    var image: UIImage? = nil
    var name: String! = ""
    var timeToCook: Int! = 0
    var recipeText: String! = ""
    var isFavourite: Bool! = false
    var clicksCount: Int! = 0
    
    init(id: Int, image: UIImage?, name: String, timeToCook: Int,
         recipeText: String) {
        self.id = id
        self.image = image
        self.name = name
        self.timeToCook = timeToCook
        self.recipeText = recipeText
        self.isFavourite = false
        self.clicksCount = 0
    }
    
    /* Used for NSUserDefaults
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id") as Int
        self.image = decoder.decodeObject(forKey: "image") as? UIImage
        self.name = decoder.decodeObject(forKey: "name") as? String
        self.timeToCook = decoder.decodeInteger(forKey: "timeToCook") as Int
        self.recipeText = decoder.decodeObject(forKey: "recipeText") as? String
        self.isFavourite = decoder.decodeBool(forKey: "isFavourite") as Bool
        self.clicksCount = decoder.decodeInteger(forKey: "clicksCount") as Int
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeCInt(Int32(self.id), forKey: "id")
        coder.encode(self.image, forKey: "image")
        coder.encode(self.name, forKey: "name")
        coder.encodeCInt(Int32(self.timeToCook), forKey: "timeToCook")
        coder.encode(self.recipeText, forKey: "recipeText")
        coder.encode(self.isFavourite, forKey: "isFavourite")
        coder.encodeCInt(Int32(self.clicksCount), forKey: "clicksCount")
    } */
}
