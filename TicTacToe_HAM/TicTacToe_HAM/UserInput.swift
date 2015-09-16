//
//  UserInput.swift
//  TicTacToe_HAM
//
//  Created by Hugh A. Miles on 9/9/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import Foundation

import UIKit


struct MyUsers {
    static var user1 = "someString"
    static var user2 = "anotherString"
}

class UserInput: UIViewController {
    
    @IBOutlet var firstPlayerName: UITextField!
    @IBOutlet var secondPlayerName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitUserOne(sender: AnyObject) {
        setUsers("one")
        
    }
    
    @IBAction func submitUserTwo(sender: AnyObject) {
        setUsers("two")
    }
    
    func setUsers (input:String)
    {
        if(input == "one") {
            print(firstPlayerName.text)
            MyUsers.user1 = firstPlayerName.text!
        }
            
        else {
            print(secondPlayerName.text)
            MyUsers.user2 = secondPlayerName.text!
        }
    
    }
}