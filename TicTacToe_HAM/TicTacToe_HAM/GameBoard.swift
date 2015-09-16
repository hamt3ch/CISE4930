//
//  GameBoard.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/14/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import UIKit

class GameBoard: UIViewController{
    
    //Positions going down >> left to right
    
    //FirstRow
    @IBOutlet var Pos0: UIImageView!
    @IBOutlet var Pos1: UIImageView!
    @IBOutlet var Pos2: UIImageView!
    
    //SecondRow
    @IBOutlet var Pos3: UIImageView!
    @IBOutlet var Pos4: UIImageView!
    @IBOutlet var Pos5: UIImageView!

    //ThirdRow
    @IBOutlet var Pos6: UIImageView!
    @IBOutlet var Pos7: UIImageView!
    @IBOutlet var Pos8: UIImageView!
    
    let cross : UIImage = UIImage(named:"tic-tac-toe-X")!
    let circle : UIImage = UIImage(named:"tic-tac-toe-O")!

    var currentUser:String = "player1"
    var checkUsers: [String] = ["player1", "player2"]
    var myBoard : [[String]] = [["0","0","0"],["0","0","0"],["0","0","0"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userPlacedPiece(sender: AnyObject) {
        let cross : UIImage = UIImage(named:"tic-tac-toe-X")!
        let circle : UIImage = UIImage(named:"tic-tac-toe-O")!
        var playerPiece : UIImage
        
        if (self.currentUser == "player1"){
            playerPiece = cross // set piece = X (Player1)
        }
        else {
            playerPiece = circle //set piece = O (Player2)
        }

        switch(sender.tag){ // parse which button has been touched
        case 0:
            print("Button 0 Pressed")
            Pos0.image = playerPiece
            myBoard[0][0] = self.currentUser
        case 1:
            print("Button 1 Pressed")
            Pos1.image = playerPiece
            myBoard[0][1] = self.currentUser
        case 2:
            print("Button 2 Pressed")
            Pos2.image = playerPiece
            myBoard[0][2] = self.currentUser
        case 3:
            print("Button 3 Pressed")
            Pos3.image = playerPiece
            myBoard[1][0] = self.currentUser
        case 4:
            print("Button 4 Pressed")
            Pos4.image = playerPiece
            myBoard[1][1] = self.currentUser
        case 5:
            print("Button 5 Pressed")
            Pos5.image = playerPiece
            myBoard[1][2] = self.currentUser
        case 6:
            print("Button 6 Pressed")
            Pos6.image = playerPiece
            myBoard[2][0] = self.currentUser
        case 7:
            print("Button 7 Pressed")
            Pos7.image = playerPiece
            myBoard[2][1] = self.currentUser
        case 8:
            print("Button 8 Pressed")
            Pos8.image = playerPiece
            myBoard[2][2] = self.currentUser
        default:
            print("Error in userPlacedPiece")
        }
        
        if (self.currentUser == "player1"){
            self.currentUser = "player2"    //tgl user user
        }
        else {
            self.currentUser = "player1"    //tgl user
        }
        
        checkForWinner() // check if game is complete
        
    }
    
    func checkForWinner () {
        
        for users in checkUsers {

            //Horizontally Row1
            if(myBoard[0][0] == users && myBoard[0][1] == users && myBoard[0][2] == users) {
                print("Top Row is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Horizontally Row2
            else if(myBoard[1][0] == users && myBoard[1][1] == users && myBoard[1][2] == users) {
                print("Middle Row is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Horizontally Row3
            else if(myBoard[2][0] == users && myBoard[2][1] == users && myBoard[2][2] == users) {
                print("Bottom Row is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Vertically Col1
            else if(myBoard[0][0] == users && myBoard[1][0] == users && myBoard[2][0] == users) {
                print("Left Column is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Vertically Col2
            else if(myBoard[0][1] == users && myBoard[1][1] == users && myBoard[2][1] == users) {
                print("Middle Column is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Vertically Col3
            else if(myBoard[0][2] == users && myBoard[1][2] == users && myBoard[2][2] == users) {
                print("Right Column is filled")
                showWinnerAlert(self.currentUser)
            }
            
            //Diagonally Right >> Left
            else if(myBoard[0][0] == users && myBoard[1][1] == users && myBoard[2][2] == users) {
                print("Left >> Right Diagonal")
                showWinnerAlert(self.currentUser)
            }
            
            //Diagonally Left >> Right
            else if(myBoard[0][2] == users && myBoard[1][1] == users && myBoard[2][0] == users) {
                print("Right >> Left Diagonal")
                showWinnerAlert(self.currentUser)
             
            }
            
            //Cats Game Case
            else if (checkForCats()) {
                let alertController = UIAlertController(title: "Cats Game!", message: "Tie game restart match", preferredStyle: .Alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .Default) { (action) in
                    self.clearBoard()
                }
                
                alertController.addAction(restartAction)
                
                self.presentViewController(alertController, animated: true) {
                    // ...
                }


            }
        }
    }
    
    func showWinnerAlert (winner:String) {
        
        let nameOfWinner = (winner == "player1") ? MyUsers.user1 : MyUsers.user2
        //Log usersWinStreak
        //addToLeaderBoard(winner)
        
        // create Alert
        let alertController = UIAlertController(title: nameOfWinner + " has won!", message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Change Players", style: .Cancel) { (action) in
            //Goto MainMenu
            self.performSegueWithIdentifier("gotoSetNewUsers", sender: self)
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Restart", style: .Default) { (action) in
            //startNewGame
            self.clearBoard()
        }
        
        alertController.addAction(OKAction)
        
        let seeLeaderAction = UIAlertAction(title: "LeaderBoard", style: .Default) { (action) in
            //startNewGame
            //self.clearBoard()
        }
        
        alertController.addAction(seeLeaderAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func clearBoard() { // reset the game board
       myBoard = [["0","0","0"],["0","0","0"],["0","0","0"]]
       Pos0.image = nil
       Pos1.image = nil
       Pos2.image = nil
       Pos3.image = nil
       Pos4.image = nil
       Pos5.image = nil
       Pos6.image = nil
       Pos7.image = nil
       Pos8.image = nil

    }
    
    func checkForCats () -> Bool {
        for i in 0 ... 2 {
            for j in 0 ... 2 {
                if(myBoard[i][j] == "0"){ // if it catches a 0 >> Moves are still available
                    return false
                }
            }
        }
        
        return true // no more moves available
    }
}