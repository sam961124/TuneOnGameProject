//
//  ViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/15.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

let defaults = NSUserDefaults.standardUserDefaults()
var fb_status = false
var id: Int = Int()
var level: Int = Int()
var money: Int = Int()
var right_count: Int = Int()
var wrong_count: Int = Int()
var correct: Int = Int()
var qid: String = String()
var eid: String = String()
var category: String = String()
var quiz_level: String = String()
var youtube_id: String = String()
var image_url: String = String()
var question: String = String()
var freeitem: Int = Int()
var choice_string = ["", "", "", ""]
let category_name = ["100": "神秘類", "200": "演員類", "300": "產品類",
                     "400": "場景類", "500": "聲音類", "600": "圖形類",
                     "700": "數字類", "800": "臺詞類", "900": "趣味類"]
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func HTTPPostJSON(data: NSData, callback: (NSData, String?)->Void){
        let request = NSMutableURLRequest(URL: NSURL(string: "http://dbms3.tuneon.com.tw/~ws20/ws/2.0/request_qz.php")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.HTTPBody = data
        HTTPsendRequest(request, callback: callback)
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest, callback: (NSData, String?) -> Void){
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if (error != nil) {
                callback(data!, error?.localizedDescription)
            } else {
                callback(data!, nil)
            }
        }
        task.resume()
    }
    
    func ExpRate() -> CGFloat{
        if CGFloat(right_count) > pow(CGFloat(level),2){
            return (CGFloat(right_count) - pow(CGFloat(level),2))/(pow(CGFloat(level+1),2) - pow(CGFloat(level),2))
        }
        else{
            return 0
        }
    }
    
    func TurnPage(number: Int){
        let pages: [String] = ["State0_ErrorViewController", "State1_SplashViewController", "State2_MainViewController", "State3_PreparingViewController", "State4_YoutubeViewController", "State5_ImageViewController", "State6_QuizViewController", "State7_RightViewController", "State8_WrongViewController", "State9_LevelUpViewController"]
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier(pages[number])
        self.presentViewController(nextviewController, animated: true, completion: nil)
    }
}

