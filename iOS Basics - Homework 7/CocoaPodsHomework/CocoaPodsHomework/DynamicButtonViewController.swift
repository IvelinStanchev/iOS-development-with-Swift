//
//  DynamicButtonViewController.swift
//  CocoaPodsHomework
//
//  Created by Ivelin on 2/1/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit
import DynamicButton

class DynamicButtonViewController: UIViewController {
    @IBOutlet weak var button: DynamicButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Animate the style update
        self.button.setStyle(DynamicButtonStyle.close, animated: true)
        
        // Do any additional setup after loading the view.
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
