//
//  ViewController.swift
//  top100Billboard
//
//  Created by Hugh A. Miles on 9/18/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Web: UIWebView!
    var html: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.billboard.com/charts/hot-100")
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!)
        { (data,response,error)-> Void in
            if data != nil
            {
                print(data)
            }
            else
            {
                print("Something bad happened")
            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

