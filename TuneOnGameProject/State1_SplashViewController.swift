//
//  State1_SplashViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State1_SplashViewController: ViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        
        //server communicate code from here
        var requestNSData: NSData = NSData()
        if (false){
            let ori_data: Dictionary<String, AnyObject> = ["cmd": "getid"]
        }
        else{
            let ori_data: Dictionary<String, AnyObject> = ["cmd": "getid", "id": "632"]
            do{
                requestNSData = try NSJSONSerialization.dataWithJSONObject(ori_data, options: NSJSONWritingOptions.PrettyPrinted)
            } catch let error as NSError {
                print(error)
            }
            HTTPPostJSON(requestNSData){
                (response, error) -> Void in
                if (error != nil){
                    print(error)
                }
                print(response)
                super.TurnPage(0)
            }
        }
        
        //tune_on_title code from here
        var tune_on_title: UIImageView
        let title_image: UIImage = UIImage(named: "title.png")!
        let Tap = UITapGestureRecognizer(target: self, action: Selector("Tap:"))
        Tap.numberOfTapsRequired = 1
        tune_on_title = UIImageView(image: title_image)
        tune_on_title.frame.size.width = screen_width/2
        tune_on_title.frame.size.height = (screen_width/2)*((title_image.size.height)/(title_image.size.width))
        tune_on_title.center = CGPointMake(screen_width/2, screen_height/2)
        tune_on_title.contentMode = UIViewContentMode.ScaleAspectFit
        tune_on_title.userInteractionEnabled = true
        tune_on_title.addGestureRecognizer(Tap)
        self.view.addSubview(tune_on_title)
        
        //welcome_back code from here
        var welcome_label: UILabel
        let welcome_string = "歡迎回來！"
        welcome_label = UILabel(frame: CGRect(x:0, y:0, width:0.6*tune_on_title.frame.width, height:tune_on_title.frame.height/5))
        welcome_label.center = CGPoint(x: screen_width/2, y: 0.7*screen_height)
        welcome_label.text = welcome_string
        welcome_label.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        welcome_label.adjustsFontSizeToFitWidth = true
        welcome_label.numberOfLines = 0
        welcome_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        welcome_label.minimumScaleFactor = 20/welcome_label.font.pointSize
        welcome_label.textAlignment = NSTextAlignment.Center
        welcome_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(welcome_label)
        
        //end here

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func Tap(image: UIImageView){
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("State2_MainViewController")
        self.presentViewController(nextviewController, animated: false, completion: nil)
        //self.presentViewController(nextviewController, animated: true, completion: )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
