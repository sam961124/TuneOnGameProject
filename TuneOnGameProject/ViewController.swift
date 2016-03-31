//
//  ViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/15.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

var id: String = String()
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
var freeitem_amount: Int = Int()
var choice_string = ["", "", "", ""]
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func TurnPage(number: Int){
        let pages: [String] = ["State0_ErrorViewController", "State1_SplashViewController", "State2_MainViewController", "State3_PreparingViewController", "State4_YoutubeViewController", "State5_ImageViewController", "State6_QuizViewController", "State7_RightViewController", "State8_WrongViewController"]
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier(pages[number])
        self.presentViewController(nextviewController, animated: true, completion: nil)
    }
}

