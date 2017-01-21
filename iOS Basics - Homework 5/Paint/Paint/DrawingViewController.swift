//
//  DrawingViewController.swift
//  Paint
//
//  Created by Ivelin on 1/21/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit
import CoreGraphics

class DrawingViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var previousTouch: CGPoint?
    var lineProperties: (R: Float, G: Float, B: Float, Alpha: Float, Width: Float) = (0.0, 0.0, 0.0, 1.0, 4.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.clearImage(notification:)), name: Notification.Name("ClearImage"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setWhiteBackground(notification:)), name: Notification.Name("SetWhiteBackground"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setBlackBackground(notification:)), name: Notification.Name("SetBlackBackground"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLineProperties(notification:)), name: Notification.Name("LineChanged"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearImage(notification: Notification) {
        self.imageView?.image = UIImage.init()
    }
    
    func setWhiteBackground(notification: Notification) {
        self.imageView?.backgroundColor = UIColor.white
    }
    
    func setBlackBackground(notification: Notification) {
        self.imageView?.backgroundColor = UIColor.black
    }
    
    func updateLineProperties(notification: Notification) {
        let returnedTuple = notification.object! as! (Float, Float, Float, Float, Float)
        
        lineProperties = returnedTuple
    }

    func drawLine(_ begining:CGPoint, end:CGPoint){
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        self.imageView!.image?.draw(in: self.view.frame)
        context?.move(to: begining)
        context?.addLine(to: end)
        context?.setLineWidth(CGFloat(lineProperties.Width))
        
        let strokeColor = UIColor.init(red: CGFloat(lineProperties.R),
                                       green: CGFloat(lineProperties.G),
                                       blue: CGFloat(lineProperties.B),
                                       alpha: CGFloat(lineProperties.Alpha))
        
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setLineCap(.round)
        context?.strokePath()
        context?.setBlendMode(.normal)
        
        self.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let lastTouch = touches.first
        lineProperties.Width = lineProperties.Width + Float((lastTouch?.force)!)
        let position = lastTouch?.location(in: self.imageView)
        self.previousTouch = position
        drawLine(self.previousTouch!, end: position!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lastTouch = touches.first
        lineProperties.Width = lineProperties.Width + Float((lastTouch?.force)!)
        let position = lastTouch?.location(in: self.imageView)
        drawLine(self.previousTouch!, end: position!)
        self.previousTouch = position
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lastTouch = touches.first
        let position = lastTouch?.location(in: self.imageView)
        drawLine(self.previousTouch!, end: position!)
    }
}
