//
//  LeaderBoard.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/16/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import UIKit

class LeaderBoard: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return players.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        print(players)
        print(players[indexPath.row])
        print(leaderboard)
        
        if(leaderboard[players[indexPath.row]] != nil) {
            cell.textLabel!.text = String(players[indexPath.row])
            return cell
        }
        
        else
        {
            return cell
        }

    }


}
