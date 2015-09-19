//
//  Instructions.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/18/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import UIKit

class Instructions: UIViewController {
    
    @IBOutlet var instructionsLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        self.instructionsLabel.numberOfLines = 10
        self.instructionsLabel.font = UIFont(name: self.instructionsLabel.font.fontName, size: 12)
        self.instructionsLabel.text = "The object of Tic Tac Toe is to get three in a row. You play on a three by three game board. The first player is known as X and the second is O. Players alternate placing Xs and Os on the game board until either oppent has three in a row or all nine squares are filled. X always goes first, and in the event that no one has three in a row, the stalemate is called a cat game."
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
