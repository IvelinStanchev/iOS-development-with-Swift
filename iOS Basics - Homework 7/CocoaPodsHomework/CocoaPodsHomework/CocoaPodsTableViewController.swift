//
//  CocoaPodsTableViewController.swift
//  CocoaPodsHomework
//
//  Created by Ivelin on 2/1/17.
//  Copyright © 2017 SoftUni. All rights reserved.
//

import UIKit
import DynamicButton
import Nuke

class CocoaPodsTableViewController: UITableViewController {

    var data: [CocoaPodModel] = [
        CocoaPodModel.init(imageLink: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201701231950", name: "DynamicButton", link: "https://cocoapods.org/pods/DynamicButton"),
        CocoaPodModel.init(imageLink: "http://www.w3schools.com/css/img_fjords.jpg", name: "DynamicColor", link: "https://cocoapods.org/pods/DynamicColor"),
        CocoaPodModel.init(imageLink: "http://ichef-1.bbci.co.uk/news/660/cpsprodpb/A2E4/production/_89400714_gettyimages-522829204.jpg", name: "DynamicFont", link: "https://cocoapods.org/pods/DynamicFont")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as! CustomTableViewCell
        
        //dynamically downloading images
        Nuke.loadImage(with: URL(string: data[indexPath.row].imageLink)!, into: cell.cocoaPodImageView)

        cell.cocoaPodName.text = data[indexPath.row].name
        cell.cocoaPodLink.text = data[indexPath.row].link
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var next: UIViewController? = nil
        
        if data[indexPath.row].name == "DynamicButton" {
            next = mainStoryboard.instantiateViewController(withIdentifier: "DynamicButtonViewController") as! DynamicButtonViewController
        } else if data[indexPath.row].name == "DynamicFont" {
            next = mainStoryboard.instantiateViewController(withIdentifier: "DynamicFontViewController") as! DynamicFontViewController
        } else if data[indexPath.row].name == "DynamicColor" {
            next = mainStoryboard.instantiateViewController(withIdentifier: "DynamicColorViewController") as! DynamicColorViewController
        }
        
        if next != nil {
            self.navigationController?.pushViewController(next!, animated: true)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
