//
//  ViewController.swift
//  Chinese Zodiac
//
//  Created by xuhui on 15/5/15.
//  Copyright (c) 2015年 xuhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var img: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btn.layer.cornerRadius = 8.0
        
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "hideKeybad:"))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "hideKeybad:"))
        
        
        var year = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)?.components(NSCalendarUnit.CalendarUnitYear, fromDate: NSDate()).year
        input.text = "\(year!)"
        
        self.getZodiacByYear(year!)
        
        
        //TODO:test
        let now = NSDate()
        
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var oldDate:NSDate? = formatter.dateFromString("1990-08-04")
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

        let components = gregorian!.components(NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth, fromDate: oldDate!, toDate: now, options: NSCalendarOptions(0))
        
        println(components.year)
        println(components.month)
        
        
        
        
    }
    
    
    /**
    点击Button
    */
    @IBAction func touchBtn()
    {
        var yearOfBirth = input.text
        
        //去前后空格
        yearOfBirth = yearOfBirth.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " "))
        
        if !yearOfBirth.isEmpty
        {
            println("\(yearOfBirth)")
            getZodiacByYear(yearOfBirth.toInt()!)
        }

    }
    
    /**
    点击View隐藏键盘
    
    :param: gestureRecognizer 手势
    */
    func hideKeybad(gestureRecognizer:UIPanGestureRecognizer)
    {
        if input.isFirstResponder()
        {
            input.resignFirstResponder()
        }
    }
    
    /**
    根据年份计算出当前年的生肖
    
    :param: year 年份
    */
    func getZodiacByYear(year:Int)
    {
        var type = ((year + 9) % 12) - 1
        img.image = UIImage(named: "\(type).png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

