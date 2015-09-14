//
//  GameBoard.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/14/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import Foundation

import UIKit

class GameBoard: UIViewController {
    
    //Positions going down >> left to right
    
    //FirstRow
    @IBOutlet var pos0: UIImageView!
    @IBOutlet var pos1: UIImageView!
    @IBOutlet var pos2: UIImageView!
    
    //SecondRow
    @IBOutlet var pos3: UIImageView!
    @IBOutlet var pos4: UIImageView!
    @IBOutlet var pos5: UIImageView!

    //ThirdRow
    @IBOutlet var pos6: UIImageView!
    @IBOutlet var pos7: UIImageView!
    @IBOutlet var pos8: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var circle : UIImage = UIImage(named:"tic-tac-toe-O")!
        pos0.image = circle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setPiece(position:UIImageView, shape:String){ //places pieces in certain positions
        
    }
    
    @IBAction func userPlacedPiece(sender: AnyObject) {
        var value:NSString = sender.currentTitle!! // unwrap button
        var intVal:Int = value.integerValue
        print(intVal)
        switch(intVal){
        case 0:
            print("Button 0 Pressed")
        case 1:
            print("Button 1 Pressed")
        case 2:
            print("Button 2 Pressed")
        case 3:
            print("Button 3 Pressed")
        case 4:
            print("Button 4 Pressed")
        case 5:
            print("Button 5 Pressed")
        case 6:
            print("Button 6 Pressed")
        case 7:
            print("Button 7 Pressed")
        case 8:
            print("Button 8 Pressed")
        default:
            print("Error in userPlacedPiece")

        }
    }
  
    
}