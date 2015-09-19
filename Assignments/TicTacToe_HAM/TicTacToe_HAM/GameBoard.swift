//
//  GameBoard.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/14/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation
import UIKit

//var leaderBoard : [String:Int] = []

var count = 0
var content = ["Third":1 , "First" : 5 ,"Second" : 4 ]
var players = [String]()
var leaderboard = [String]()

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
        
        var positions = [Pos0,Pos1,Pos2,Pos3,Pos4,Pos5,Pos6,Pos7,Pos8]
        for i in 0 ... 8 {
            positions[i].userInteractionEnabled = true
            let tapGuesture = UITapGestureRecognizer()
            tapGuesture.addTarget(self, action: "tappedView:")
            positions[i].addGestureRecognizer(tapGuesture)
        }
         
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tglUser () {
        if (self.currentUser == "player1"){
            self.currentUser = "player2"    //tgl user user
        }
        else {
            self.currentUser = "player1"    //tgl user
        }
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
        addToLeaderBoard(nameOfWinner)
        
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
            //Goto leaderBoard
            self.performSegueWithIdentifier("showLeaderBoard", sender: self)
        }
        
        alertController.addAction(seeLeaderAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func addToLeaderBoard (thisWinner:String) {
        leaderboard.append(thisWinner)
    }
    
    func clearBoard() { // reset the game board
       myBoard = [["0","0","0"],["0","0","0"],["0","0","0"]]
       var positions = [Pos0,Pos1,Pos2,Pos3,Pos4,Pos5,Pos6,Pos7,Pos8]
        for i in 0 ... 8 {
            positions[i].image = nil
        }
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
    
    func sortDictionaryByKey (d : [String: Int])     {
        for (k,v) in (Array(d).sort {$0.1 < $1.1}) {
            print("\(k):\(v)")
        }
        
    }
    
    func tappedView (sender:UITapGestureRecognizer){
        let cross : UIImage = UIImage(named:"tic-tac-toe-X")!
        let circle : UIImage = UIImage(named:"tic-tac-toe-O")!
        var playerPiece : UIImage
        
        if (self.currentUser == "player1"){
            playerPiece = cross // set piece = X (Player1)
        }
        else {
            playerPiece = circle //set piece = O (Player2)
        }
        
        switch(sender.view!.tag){ // parse which button has been touched
        case 0:
            if(myBoard[0][0] == "0") { // is spot is empty
                Pos0.image = playerPiece
                myBoard[0][0] = self.currentUser
                tglUser()
            }
        case 1:
            if(myBoard[0][1] == "0") {
                Pos1.image = playerPiece
                myBoard[0][1] = self.currentUser
                tglUser()
            }
        case 2:
            if(myBoard[0][2] == "0") {
                Pos2.image = playerPiece
                myBoard[0][2] = self.currentUser
                tglUser()
            }
        case 3:
            if(myBoard[1][0] == "0") {
                Pos3.image = playerPiece
                myBoard[1][0] = self.currentUser
                tglUser()
            }
        case 4:
            if(myBoard[1][1] == "0") {
                Pos4.image = playerPiece
                myBoard[1][1] = self.currentUser
                tglUser()
            }
        case 5:
            if(myBoard[1][2] == "0") {
                Pos5.image = playerPiece
                myBoard[1][2] = self.currentUser
                tglUser()
            }
        case 6:
            if(myBoard[2][0] == "0") {
                Pos6.image = playerPiece
                myBoard[2][0] = self.currentUser
                tglUser()
            }
        case 7:
            if(myBoard[2][1] == "0") {
                Pos7.image = playerPiece
                myBoard[2][1] = self.currentUser
                tglUser()
            }
        case 8:
            if(myBoard[2][2] == "0") {
                Pos8.image = playerPiece
                myBoard[2][2] = self.currentUser
                tglUser()
            }
        default:
            print("Error in userPlacedPiece")
        }
        
        checkForWinner() // check if game is complete
        
    }


}
