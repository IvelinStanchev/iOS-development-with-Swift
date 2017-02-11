//
//  DynamicFontViewController.swift
//  CocoaPodsHomework
//
//  Created by Ivelin on 2/1/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit
import DynamicFont

class DynamicFontViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.font = DynamicFont(family: .helvetica, size: 24)
        
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
