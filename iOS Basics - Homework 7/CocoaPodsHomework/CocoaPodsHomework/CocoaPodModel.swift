//
//  CocoaPodModel.swift
//  CocoaPodsHomework
//
//  Created by Ivelin on 2/1/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit

class CocoaPodModel : NSObject {
    
    var imageLink: String!
    var name: String!
    var link: String!
    var isFavourite: Bool!
    
    init(imageLink: String!, name: String!, link: String!) {
        self.imageLink = imageLink
        self.name = name
        self.link = link
        self.isFavourite = false
    }
}
