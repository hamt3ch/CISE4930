//
//  ViewController.swift
//  Horoscope_HAM
//
//  Created by Hugh A. Miles on 8/31/15.
//  Copyright © 2015 HAM. All rights reserved.
//

//* This Horoscope is based upon the reading on Sept. 2 *//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    //year start Jan 20 2015 - Jan 19 2016
    var startDates : [String: String] = ["Aries" : "21-Mar-15", "Taurus": "20-Apr-15", "Gemini": "21-May-15", "Cancer": "22-Jun-15" , "Leo": "23-Jul-15" , "Virgo": "23-Aug-15" , "Libra": "23-Sep-15" , "Scorpio": "24-Oct-15", "Sagittarius": "22-Nov-15", "Capricorn": "22-Dec-15" , "Aquarius": "20-Jan-15" , "Pisces": "19-Feb-15" ]
    
    var endDates : [String: String] = ["Aries" : "19-Apr-15", "Taurus": "20-May-15", "Gemini": "21-Jun-15", "Cancer": "22-Jul-15" , "Leo": "22-Aug-15" , "Virgo": "22-Sep-15" , "Libra": "23-Oct-15" , "Scorpio": "21-Nov-15", "Sagittarius": "21-Dec-15", "Capricorn": "19-Jan-16" , "Aquarius": "18-Feb-15" , "Pisces": "20-March-15" ]
    
    var horoDesc: [String: String] = [
        "Aries" : "When your feelings tell you something different from what the rest of the world seems to be saying, what and whom should you trust? At least you can be heartened by the fact that your uncertainty is a sign of maturity.",
        
        "Taurus": "Good news! You don’t have to adjust your schedule to stay in tune with the Earth’s rotation. You’ll be naturally in synch with all the cycles and rhythms you encounter.",
        
        "Gemini": "Tangible results motivate you. Intangible results are extremely demotivating. Please know that just because something is hard to describe doesn’t make it any less real.",
        
        "Cancer": " People think about you. People you’ve lost track of and don’t even remember think about you. Your extension of being goes much deeper and farther than you’ll ever know." ,
        
        "Leo": "The highlight of the day is how your voracious appetite for learning brings you the best that life has to offer. Travel and the arts hold particular interest. Apply your knowledge, and you’ll make money." ,
        
        "Virgo": "You’ll ask for opinions from the people you admire even though you are well aware that they do not know your world a millionth as well as you know your world. Trust yourself." ,
        
        "Libra": "A new person in your life has just the maddening quirks and charming idiosyncrasies to thrill and challenge you. Is this attraction or an annoyance? Whatever you feel, you will feel it strongly." ,
        
        "Scorpio": "One encounter sets off a chain of events. When the scenery around you is different, you’ll know that you’ve progressed. Take pictures to document this remarkable time.",
        
        "Sagittarius": "Work brings a mystery, and you’re just the one to solve it. Get others involved, though, so there will be people to applaud your genius in the end.",
        
        "Capricorn": "Relaxation and leisure — states that you believe seem better suited to people who aren’t you. At some point, you’ll see how important it is to kick up your heels — but not today." ,
        
        "Aquarius": "The current cosmic climate is heightening your awareness of others. You may even feel that you can read someone’s thoughts. As your understanding of a loved one deepens, the relationship will become more rewarding." ,
        
        "Pisces": "The simple pleasures like hot tea, cold soda or a car ride with the windows down are the things that make this day great. Your favorite person is the one who understands that." ]
    
    
    var horoTypes : [String] = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces" ]
    
    @IBOutlet var myDatePicker: UIDatePicker! // intialize viewOutlets
    @IBOutlet var horoResult: UILabel!
    
    @IBOutlet var horoDescribeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myDatePicker.datePickerMode = UIDatePickerMode.Date // 4- use time only
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Action Methods
    @IBAction func doneDateSelect(sender: AnyObject) {
        let tempRes : String = self.checkHoroscope(myDatePicker.date) // check horoscope
        
            var toDisplay = ""
        
            toDisplay += "You are a "
            toDisplay += tempRes
        
            self.horoResult.text = toDisplay
            self.horoDescribeLabel.numberOfLines = 10
            self.horoDescribeLabel.font = UIFont(name: self.horoDescribeLabel.font.fontName, size: 12)
            self.horoDescribeLabel.text = horoDesc[tempRes]
    }
    
    
    //public Methods
    func checkHoroscope (dateSelected:NSDate) -> String{
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Year] , fromDate: dateSelected)
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        if(components.month == 1 && components.day < 20) // special case for capicorn (Dec. 22 - Jan 19)
        {
            components.year = 2016
        }
            
        else
        {
            components.year = 2015
        }
        
        let formattedDate : NSDate = calendar.dateFromComponents(components)!
        
        let dateFormat = NSDateFormatter()      // set dateFormat for string
        dateFormat.dateFormat = "dd-MMM-yy"
        
        for type in horoTypes { // search through dates segements for match
            
            let lowerBound : NSDate = dateFormat.dateFromString(startDates[type]!)!
            let upperBound : NSDate = dateFormat.dateFromString(endDates[type]!)!
            
            if(formattedDate.compare(lowerBound) == NSComparisonResult.OrderedDescending && formattedDate.compare(upperBound) == NSComparisonResult.OrderedAscending || formattedDate.compare(lowerBound) == NSComparisonResult.OrderedSame || formattedDate.compare(upperBound) == NSComparisonResult.OrderedSame)
            {
                return type
            }
            
        }
        
        return "No horoscope match" // should never reach here
        
    }

}