//
//  State7_RightViewController.swift
//  TuneOnGameProject
//
//  Created by 蕭友量 on 2016/3/20.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State7_RightViewController: ViewController {

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
        var shin:UIImageView
        shin = UIImageView(image: UIImage(named: "light_success.png"))
        shin.frame.size.width = screen_width
        shin.center = CGPointMake(screen_width/2, screen_height*2/5)
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = M_PI
        rotationAnimation.duration = 5.0
        shin.layer.addAnimation(rotationAnimation, forKey: nil)
        self.view.addSubview(shin)
        //end here
        
        //top_bar code from here
        var top_bar: UIImageView
        var exp_bar: UIImageView
        var level_bar: UIImageView
        var money_bar: UIImageView
        var btn_home: UIImageView
        
        top_bar = UIImageView(frame: CGRect(x:0, y:0, width:screen_width, height:screen_width/7))
        top_bar.backgroundColor = UIColorFromRGB(0xfba928)
        self.view.addSubview(top_bar)
        
        exp_bar = UIImageView(frame: CGRect(x:0, y:top_bar.frame.height, width:screen_width, height:top_bar.frame.height/4))
        exp_bar.backgroundColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(exp_bar)
        
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
        
        btn_home = UIImageView(image: UIImage(named: "home.png"))
        btn_home.frame.size.width = 0.8*level_bar.frame.minX
        btn_home.center = CGPointMake(level_bar.frame.minX/2, top_bar.frame.height/2)
        btn_home.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_home)
        
        //level label
        var level_label: UILabel
        var level = "15"
        var level_string = "Lv " + level
        level_label = UILabel(frame: CGRect(x:0, y:0, width:top_bar.frame.width/4, height:0.8*level_bar.frame.height))
        level_label.center = CGPointMake((level_bar.frame.minX+level_bar.frame.maxX)/2, (level_bar.frame.minY+level_bar.frame.maxY)/2)
        level_label.text = level_string
        level_label.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        level_label.adjustsFontSizeToFitWidth = true
        level_label.numberOfLines = 0
        level_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        level_label.minimumScaleFactor = 8/level_label.font.pointSize
        level_label.textAlignment = NSTextAlignment.Center
        level_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(level_label)
        
        //money label
        var money_label: UILabel
        var money = "9,750"
        var bonus = "100"
        var money_string = money + " G + " + bonus + " G"
        money_label = UILabel(frame: CGRect(x:0, y:0, width:top_bar.frame.width/2, height:0.8*money_bar.frame.height))
        money_label.center = CGPointMake((money_bar.frame.minX+money_bar.frame.maxX)/2, (money_bar.frame.minY+money_bar.frame.maxY)/2)
        money_label.text = money_string
        money_label.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        money_label.adjustsFontSizeToFitWidth = true
        money_label.numberOfLines = 0
        money_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        money_label.minimumScaleFactor = 8/money_label.font.pointSize
        money_label.textAlignment = NSTextAlignment.Center
        money_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(money_label)
        
        //exp label
        var exp_label: UILabel
        var exp_percent = "0"
        var exp_string = "EXP (" + exp_percent + "/100)"
        exp_label = UILabel(frame: CGRect(x:0, y:0, width:screen_width, height:top_bar.frame.height/4))
        exp_label.center = CGPointMake(screen_width/2, (exp_bar.frame.minY+exp_bar.frame.maxY)/2)
        exp_label.text = exp_string
        exp_label.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        exp_label.adjustsFontSizeToFitWidth = true
        exp_label.numberOfLines = 0
        exp_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        exp_label.minimumScaleFactor = 8/money_label.font.pointSize
        exp_label.textAlignment = NSTextAlignment.Center
        exp_label.textColor = UIColorFromRGB(0x812b2b)
        self.view.addSubview(exp_label)
        
        //end here
        
        //txt_success code from here
        var txt_fail:UIImageView
        txt_fail = UIImageView(image: UIImage(named: "txt_success.png"))
        txt_fail.frame.size.height = screen_height
        txt_fail.frame.size.width = 2*screen_width/3
        txt_fail.center = CGPointMake(screen_width/2, screen_height*1/5)
        txt_fail.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(txt_fail)
        //end here
        
        //btn_success_next code from here
        let btn_fail_next: UIButton = UIButton()
        let fail_next: UIImage = UIImage(named: "btn_success_next_normal.png")!
        btn_fail_next.highlighted = false
        btn_fail_next.contentMode = UIViewContentMode.ScaleAspectFit
        btn_fail_next.setImage(fail_next, forState: UIControlState.Normal)
        btn_fail_next.setImage(UIImage(named: "btn_success_next_pressed.png"), forState: UIControlState.Highlighted)
        btn_fail_next.frame.size.width = screen_width/2
        btn_fail_next.frame.size.height = (screen_width/2)*(fail_next.size.height)/(fail_next.size.width)
        btn_fail_next.center = CGPointMake(screen_width/2, screen_height*2/5)
        self.view.addSubview(btn_fail_next)
        btn_fail_next.addTarget(self, action: "btn_fail_next_click:", forControlEvents: UIControlEvents.TouchUpInside)
        //end here
        
        //star_orange code from here
        var star_blue: UIImageView
        star_blue = UIImageView(image: UIImage(named: "star_orange.png"))
        star_blue.frame.size.height = screen_height
        star_blue.frame.size.width = screen_width*9/10
        star_blue.frame.size.height = (screen_width*9/10)*(star_blue.image?.size.height)!/(star_blue.image?.size.width)!
        star_blue.center = CGPointMake(screen_width/2, screen_height*37/40)
        star_blue.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(star_blue)
        //end here
        
        //doll_shock code from here
        var doll_shock: UIImageView
        doll_shock = UIImageView(image: UIImage(named: "doll_smile.png"))
        doll_shock.frame.size.width = screen_width*3/8
        doll_shock.frame.size.height = (screen_width*3/8)*(doll_shock.image?.size.height)!/(doll_shock.image?.size.width)!
        doll_shock.center = CGPointMake(screen_width/4, (screen_height*37/40)-(doll_shock.frame.size.height/2)+(star_blue.frame.size.height/2))
        doll_shock.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(doll_shock)
        //end here
        
        
        //dialog code from here
        var dialog: UIImageView
        dialog = UIImageView(image: UIImage(named: "dialog.png"))
        dialog.frame.size.width = screen_width/2
        dialog.frame.size.height = 0.75*dialog.frame.size.width
        dialog.center = CGPointMake(screen_width*11/16, screen_height*29/40)
        dialog.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(dialog)
        
        //dialog label
        var dialog_label: UILabel
        let dialog_string = "答對啦!"
        dialog_label = UILabel(frame: CGRect(x:0, y:0, width:0.5*dialog.frame.width, height:0.9*dialog.frame.height))
        dialog_label.center = CGPoint(x: (dialog.frame.minX + dialog.frame.maxX)/2, y: (dialog.frame.minY + dialog.frame.maxY)/2)
        dialog_label.text = dialog_string
        dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        dialog_label.adjustsFontSizeToFitWidth = true
        dialog_label.numberOfLines = 1
        dialog_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        dialog_label.minimumScaleFactor = 16/dialog_label.font.pointSize
        dialog_label.textAlignment = NSTextAlignment.Center
        dialog_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(dialog_label)
        //end here

        
        // Do any additional setup after loading the view.
    }
    
    func btn_fail_next_click(button: UIButton) {
        button.highlighted = true
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("State1_SplashViewController")
        self.presentViewController(nextviewController, animated: false, completion: nil)
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
