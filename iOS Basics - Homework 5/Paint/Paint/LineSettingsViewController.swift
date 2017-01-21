//
//  LineSettingsViewController.swift
//  Paint
//
//  Created by Ivelin on 1/21/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit

class LineSettingsViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let tupleToSend = (R: redSlider!.value,
                           G: greenSlider!.value,
                           B: blueSlider!.value,
                           Alpha: alphaSlider!.value,
                           LineWidth: widthSlider!.value)
        
        NotificationCenter.default.post(name: Notification.Name("LineChanged"), object: tupleToSend)
    }
    
    func updateCurrentImageColor() {
        let color: UIColor = UIColor.init(red: CGFloat(redSlider!.value),
                                          green: CGFloat(greenSlider!.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: CGFloat(alphaSlider.value))
        
        self.imageView?.backgroundColor = color
    }

    
    @IBAction func sliderMoved(_ sender: UISlider) {
        updateCurrentImageColor()
    }
}
