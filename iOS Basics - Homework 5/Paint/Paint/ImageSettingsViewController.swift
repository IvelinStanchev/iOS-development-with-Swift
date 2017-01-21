//
//  ImageSettingsViewController.swift
//  Paint
//
//  Created by Ivelin on 1/21/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit

class ImageSettingsViewController: UIViewController {

    @IBOutlet weak var clearImagebutton: UIButton!
    @IBOutlet weak var setBackgroundToWhiteButton: UIButton!
    @IBOutlet weak var setBackgroundToBlackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonCicked(_ sender: UIButton) {
        
        switch sender {
        case clearImagebutton:
            NotificationCenter.default.post(name: Notification.Name("ClearImage"), object: nil)
        case setBackgroundToWhiteButton:
            NotificationCenter.default.post(name: Notification.Name("SetWhiteBackground"), object: nil)
        case setBackgroundToBlackButton:
            NotificationCenter.default.post(name: Notification.Name("SetBlackBackground"), object: nil)
        default:
            break
        }
    }
    

}
