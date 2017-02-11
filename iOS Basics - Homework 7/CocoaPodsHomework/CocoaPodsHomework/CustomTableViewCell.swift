//
//  CustomTableViewCell.swift
//  CocoaPodsHomework
//
//  Created by Ivelin on 2/1/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cocoaPodImageView: UIImageView!
    @IBOutlet weak var cocoaPodName: UILabel!
    @IBOutlet weak var cocoaPodLink: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    var isFavourite = false

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cocoaPodImageView.layer.cornerRadius = self.cocoaPodImageView.bounds.width / 2
        self.cocoaPodImageView.layer.borderColor = UIColor.yellow.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tapDetected() {
        isFavourite = !isFavourite
        
        if isFavourite == true {
            self.cocoaPodImageView.layer.borderWidth = self.frame.size.height / 10.0//10 % of the cell height
            self.favouriteImage.image = UIImage(named: "star_favourites_full.png")
        } else {
            self.cocoaPodImageView.layer.borderWidth = 0
            self.favouriteImage.image = UIImage(named: "star_favourites_empty.png")
        }
    }

    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        tapDetected()
    }

}
