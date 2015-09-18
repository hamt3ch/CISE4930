//
//  songViewController.swift
//  top100Billboard
//
//  Created by Hugh A. Miles on 9/18/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import UIKit

class SongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var songs = [String]()
    var decodedContent:NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        
        cell.textLabel!.text = "Hit me baby one more time"
        cell.detailTextLabel?.text = "Brittney Spears"
        return cell
        
    }
    
    
    
    
    
    
}
