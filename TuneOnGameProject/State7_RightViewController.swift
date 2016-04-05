//
//  State7_RightViewController.swift
//  TuneOnGameProject
//
//  Created by 蕭友量 on 2016/3/20.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State7_RightViewController: ViewController {

    var dialog: UIImageView!
    var dialog_label: UILabel!
    var dialog_center_x: CGFloat!
    var dialog_center_y: CGFloat!
    var shin: UIImageView!
    var timer = NSTimer()
    var exp_rate:CGFloat = CGFloat()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if number != 0{
            defaults.setBool(false, forKey: "Answering")
            action.removeAll()
        }
        //dialog animation code from here
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.dialog.frame.size.width *= 2
            self.dialog.frame.size.height *= 2
            self.dialog_label.frame.size.width *= 2
            self.dialog_label.frame.size.height *= 2
            self.dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: self.view.frame.width*0.05)
            self.dialog.center = CGPoint(x: self.dialog_center_x, y: self.dialog_center_y)
            self.dialog_label.center = CGPoint(x: self.dialog_center_x, y: self.dialog_center_y)
            }, completion: nil)
        //end here
        //timer
        timer = NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: #selector(State7_RightViewController.shin_rotate), userInfo: nil, repeats: false)
        timer = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: #selector(State7_RightViewController.shin_rotate), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //dialog animation code from here
        dialog.frame.size.width /= 2
        dialog.frame.size.height /= 2
        dialog_label.frame.size.width /= 2
        dialog_label.frame.size.height /= 2
        dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: view.frame.width*0.025)
        dialog.center = CGPoint(x: dialog_center_x, y: dialog_center_y)
        dialog_label.center = CGPoint(x: dialog_center_x, y: dialog_center_y)
        //end here
        
        //server communicate code from here
        var requestNSData: NSData = NSData()
        let data = ["cmd": "getquiz", "id": id, "actions": action]
        do{
            print("yes")
            requestNSData = try NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted)
            print(requestNSData)
        } catch let error as NSError {
            print(error)
        }
        HTTPPostJSON(requestNSData){
            (response, error) -> Void in
            if (error != nil){
                print(error)
                number = 0
            }
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(response, options: .AllowFragments)
                level = (json["appUser"]!!["level"] as! Int)
                money = (json["appUser"]!!["money"] as! Int)
                right_count = (json["appUser"]!!["rightcount"] as! Int)
                wrong_count = (json["appUser"]!!["wrongcount"] as! Int)
                qid = (json["quiz"]!!["qid"] as! String)
                defaults.setObject(qid, forKey: "qid")
                eid = (json["quiz"]!!["eid"] as! String)
                defaults.setObject(eid, forKey: "eid")
                category = (json["quiz"]!!["category"] as! String)
                defaults.setObject(category, forKey: "category")
                quiz_level = (json["quiz"]!!["level"] as! String)
                defaults.setObject(quiz_level, forKey: "quiz_level")
                youtube_id = (json["quiz"]!!["youtube"] as! String)
                defaults.setObject(youtube_id, forKey: "youtube_id")
                let imageurl = (json["quiz"]!!["imageurl"])
                question = (json["quiz"]!!["summary"] as! String)
                defaults.setObject(question, forKey: "question")
                let uries = (json["quiz"]!!["uries"])
                
                defaults.setBool(false, forKey: "playback")
                defaults.setBool(false, forKey: "friend")
                defaults.setBool(false, forKey: "remove")
                for i in 0...3{
                    sel[i] = (json["quiz"]!!["sel_\(i+1)"] as! Int)
                    defaults.setInteger(sel[i], forKey: "sel_\(i)")
                    choice_string[i] = uries!![i]["hint"] as! String
                    defaults.setObject(choice_string[i], forKey: "choice_string\(i)")
                    print(choice_string[i])
                    print(uries!![i]["subtypeid"])
                    if "501" == uries!![i]["subtypeid"] as! String{
                        correct = i
                        defaults.setInteger(correct, forKey: "correct")
                    }
                }
                if youtube_id == ""{
                    number = 5
                    image_url = imageurl as! String
                    defaults.setObject(image_url, forKey: "image_url")
                }
                else if imageurl is NSNull{
                    number = 4
                }
                else{
                    number = 0
                }
            } catch{
                print("error serializaing JSON: \(error)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        
        //gradient_color code from here
        let top_color = UIColorFromRGB(0xfdca41)
        let buttom_color = UIColorFromRGB(0xfffb96)
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [top_color.CGColor, buttom_color.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        //end here
        
        //shinning code from here
        
        shin = UIImageView(image: UIImage(named: "light_success.png"))
        shin.frame.size.width = screen_width
        shin.center = CGPointMake(screen_width/2, 0.42*screen_height)
        self.view.addSubview(shin)
        //end here
        
        //top_bar code from here
        var top_bar: UIImageView
        var exp_bar: UIImageView
        var real_exp_bar: UIImageView
        var level_bar: UIImageView
        var money_bar: UIImageView
        let btn_home: UIButton = UIButton()
        let home: UIImage = UIImage(named: "home.png")!
        exp_rate = (CGFloat(right_count+1) - pow(CGFloat(level),2))/(pow(CGFloat(level+1),2) - pow(CGFloat(level),2))
        top_bar = UIImageView(frame: CGRect(x:0, y:0, width:screen_width, height:screen_width/7))
        top_bar.backgroundColor = UIColorFromRGB(0xfba928)
        self.view.addSubview(top_bar)
        
        exp_bar = UIImageView(frame: CGRect(x:0, y:top_bar.frame.height, width:screen_width, height:top_bar.frame.height/4))
        exp_bar.backgroundColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(exp_bar)
        
        real_exp_bar = UIImageView(frame: CGRect(x:0, y:top_bar.frame.height, width:exp_rate*screen_width, height:top_bar.frame.height/4))
        real_exp_bar.backgroundColor = UIColorFromRGB(0x74f2e8)
        self.view.addSubview(real_exp_bar)
        
        level_bar = UIImageView(frame: CGRect(x:top_bar.frame.height, y:top_bar.frame.height/5, width:top_bar.frame.width/4, height:top_bar.frame.height-(2*top_bar.frame.height/5)))
        level_bar.layer.cornerRadius = level_bar.frame.height/2
        level_bar.layer.masksToBounds = true
        level_bar.backgroundColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(level_bar)
        
        money_bar = UIImageView(frame: CGRect(x:3*top_bar.frame.width/7, y:top_bar.frame.height/5, width:top_bar.frame.width/2, height:top_bar.frame.height-(2*top_bar.frame.height/5)))
        money_bar.layer.cornerRadius = money_bar.frame.height/2
        money_bar.layer.masksToBounds = true
        money_bar.backgroundColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(money_bar)
        
        btn_home.setImage(home, forState: UIControlState.Normal)
        btn_home.frame.size.width = 0.8*level_bar.frame.minX
        btn_home.frame.size.height = 0.8*level_bar.frame.minX*(home.size.height)/(home.size.width)
        btn_home.center = CGPointMake(level_bar.frame.minX/2, top_bar.frame.height/2)
        btn_home.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_home)
        btn_home.addTarget(self, action: #selector(State3_PreparingViewController.btn_home_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //level label
        var level_label: UILabel
        let level_string = "Lv \(level)"
        level_label = UILabel(frame: CGRect(x:0, y:0, width:top_bar.frame.width/4, height:0.8*level_bar.frame.height))
        level_label.center = CGPointMake((level_bar.frame.minX+level_bar.frame.maxX)/2, (level_bar.frame.minY+level_bar.frame.maxY)/2)
        level_label.text = level_string
        level_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        level_label.numberOfLines = 1
        level_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        level_label.textAlignment = NSTextAlignment.Center
        level_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(level_label)
        
        //money label
        var money_label: UILabel
        let money_string = "\(money) G + \(quiz_level) G"
        money_label = UILabel(frame: CGRect(x:0, y:0, width:top_bar.frame.width/2, height:0.8*money_bar.frame.height))
        money_label.center = CGPointMake((money_bar.frame.minX+money_bar.frame.maxX)/2, (money_bar.frame.minY+money_bar.frame.maxY)/2)
        money_label.text = money_string
        money_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        money_label.numberOfLines = 1
        money_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        money_label.textAlignment = NSTextAlignment.Center
        money_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(money_label)
        
        //exp label
        var exp_label: UILabel
        let exp_string = "EXP (\(Int(exp_rate*100))/100)"
        exp_label = UILabel(frame: CGRect(x:0, y:0, width:screen_width, height:top_bar.frame.height/4))
        exp_label.center = CGPointMake(screen_width/2, (exp_bar.frame.minY+exp_bar.frame.maxY)/2)
        exp_label.text = exp_string
        exp_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.025*screen_width)
        exp_label.numberOfLines = 1
        exp_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        exp_label.textAlignment = NSTextAlignment.Center
        exp_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(exp_label)
        //end here
        
        //txt_success code from here
        var txt_success:UIImageView
        txt_success = UIImageView(image: UIImage(named: "txt_success.png"))
        txt_success.frame.size.height = screen_height
        txt_success.frame.size.width = 2*screen_width/3
        txt_success.center = CGPointMake(screen_width/2, 0.22*screen_height)
        txt_success.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(txt_success)
        //end here
        
        //btn_success_next code from here
        let btn_success_next: UIButton = UIButton()
        let fail_next: UIImage = UIImage(named: "btn_success_next_normal.png")!
        btn_success_next.highlighted = false
        btn_success_next.contentMode = UIViewContentMode.ScaleAspectFit
        btn_success_next.setImage(fail_next, forState: UIControlState.Normal)
        btn_success_next.setImage(UIImage(named: "btn_success_next_pressed.png"), forState: UIControlState.Highlighted)
        btn_success_next.frame.size.width = screen_width/2
        btn_success_next.frame.size.height = (screen_width/2)*(fail_next.size.height)/(fail_next.size.width)
        btn_success_next.center = CGPointMake(screen_width/2, 0.42*screen_height)
        self.view.addSubview(btn_success_next)
        btn_success_next.addTarget(self, action: #selector(State7_RightViewController.btn_success_next_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //end here
        
        //star_orange code from here
        var star_orange: UIImageView
        star_orange = UIImageView(image: UIImage(named: "star_orange.png"))
        star_orange.frame.size.height = screen_height
        star_orange.frame.size.width = screen_width*9/10
        star_orange.frame.size.height = (screen_width*9/10)*(star_orange.image?.size.height)!/(star_orange.image?.size.width)!
        star_orange.center = CGPointMake(screen_width/2, screen_height*37/40)
        star_orange.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(star_orange)
        //end here
        
        //doll_smile code from here
        var doll_smile: UIImageView
        doll_smile = UIImageView(image: UIImage(named: "doll_smile.png"))
        doll_smile.frame.size.width = 0.35*screen_width
        doll_smile.frame.size.height = (0.35*screen_width)*(doll_smile.image?.size.height)!/(doll_smile.image?.size.width)!
        doll_smile.center = CGPointMake(0.28*screen_width, (screen_height*37/40)-(doll_smile.frame.size.height/2)+(star_orange.frame.size.height/2))
        doll_smile.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(doll_smile)
        //end here
        
        //dialog code from here
        //var dialog: UIImageView
        dialog = UIImageView(image: UIImage(named: "dialog.png"))
        dialog.frame.size.width = 1.2*doll_smile.frame.width
        dialog.frame.size.height = screen_width/2*(dialog.image?.size.height)!/(dialog.image?.size.width)!
        dialog_center_x = doll_smile.frame.maxX+dialog.frame.width/2
        dialog_center_y = doll_smile.frame.minY+0.3*doll_smile.frame.height
        dialog.center = CGPointMake(dialog_center_x, dialog_center_y)
        dialog.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(dialog)
        
        //dialog label
        //var dialog_label: UILabel
        let dialog_string = "答對啦!"
        dialog_label = UILabel(frame: CGRect(x:0, y:0, width:0.7*dialog.frame.width, height:0.9*dialog.frame.height))
        dialog_label.center = CGPoint(x: (dialog.frame.minX + dialog.frame.maxX)/2, y: 0.495*(dialog.frame.minY + dialog.frame.maxY))
        dialog_label.text = dialog_string
        dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: screen_width*0.05)
        dialog_label.numberOfLines = 2
        dialog_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        dialog_label.textAlignment = NSTextAlignment.Center
        dialog_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(dialog_label)
        //end here
        
        // Do any additional setup after loading the view.
    }
    
    func shin_rotate(){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = 2*M_PI
        rotationAnimation.duration = 8.0
        shin.layer.addAnimation(rotationAnimation, forKey: nil)
    }
    func btn_home_click(button: UIButton){
        TurnPage(2)
    }
    
    func btn_success_next_click(button: UIButton) {
        button.highlighted = true
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            button.center.x = self.view.frame.width
            }, completion: nil)
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()){}
        if exp_rate == 1{
            TurnPage(9)
        }
        else{
            TurnPage(number)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if (self.view.window == nil) {
            self.view = nil
        }
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
