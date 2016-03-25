//
//  State2_MainViewController.swift
//  TuneOnGameProject
//
//  Created by 蕭友量 on 2016/3/20.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State2_MainViewController: ViewController {
    
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        
        //background code form here
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "stripe.png")!)
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
        var money_string = money + " G"
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
        
        //main page scroll area code from here
        scrollView = UIScrollView(frame: CGRect( x:0, y:5*top_bar.frame.height/4, width: screen_width, height: screen_height-5*top_bar.frame.height/4))
        scrollView.contentSize = CGSizeMake(view.frame.width, 2 * view.frame.width+15)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(scrollView)
        //end here
        
        //box
        var first_box: UIImageView
        first_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        first_box.backgroundColor = UIColorFromRGB(0xfffb96)
        first_box.layer.cornerRadius = 10
        first_box.alpha = 0.5
        scrollView.addSubview(first_box)
        var start_doll: UIImageView
        start_doll = UIImageView(image: UIImage(named: "doll_upper.png"))
        start_doll.frame.size.height = 0.95*first_box.frame.height
        start_doll.center = CGPointMake(first_box.frame.minX+3*first_box.frame.width/4, first_box.frame.minY+first_box.frame.height-(start_doll.frame.height/2))
        start_doll.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(start_doll)
        let btn_start_game: UIButton = UIButton()
        let start_game: UIImage = UIImage(named: "btn_start_answer_normal.png")!
        btn_start_game.highlighted = false
        btn_start_game.contentMode = UIViewContentMode.ScaleAspectFit
        btn_start_game.setImage(start_game, forState: UIControlState.Normal)
        btn_start_game.setImage(UIImage(named: "btn_start_answer_pressed.png"), forState: UIControlState.Highlighted)
        btn_start_game.frame.size.width = 2*first_box.frame.width/5
        btn_start_game.frame.size.height = 3*first_box.frame.height/7
        btn_start_game.center = CGPointMake(first_box.frame.minX+first_box.frame.width/4, first_box.frame.minY+first_box.frame.height/2)
        scrollView.addSubview(btn_start_game)
        btn_start_game.addTarget(self, action: "btn_fail_next_click:", forControlEvents: UIControlEvents.TouchUpInside)

        
        
        var second_box: UIImageView
        second_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width + first_box.frame.maxY, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        second_box.backgroundColor = UIColorFromRGB(0xfffb96)
        second_box.layer.cornerRadius = 10
        second_box.alpha = 0.5
        scrollView.addSubview(second_box)
        
        //ranking & IQ & FB_login
        var btn_fb_login: UIButton = UIButton()
        var ranking_label1: UILabel
        var ranking_label2: UILabel
        var iq_label1: UILabel
        var iq_label2: UILabel
        var fb_login_label: UILabel
        let ranking_string1 = "你的線上排名"
        let iq_string1 = "你的IQ"
        let fb_string = "缺金幣?想升級?看排行?登入臉書進入進階模式!"
        
        ranking_label1 = UILabel(frame: CGRect(x:second_box.frame.minX+0.05*second_box.frame.width, y:second_box.frame.height/12+second_box.frame.minY, width:0.4*second_box.frame.width, height:second_box.frame.height/12))
        ranking_label1.text = ranking_string1
        ranking_label1.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        ranking_label1.adjustsFontSizeToFitWidth = true
        ranking_label1.numberOfLines = 1
        ranking_label1.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        ranking_label1.minimumScaleFactor = 16/ranking_label1.font.pointSize
        ranking_label1.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(ranking_label1)
        
        iq_label1 = UILabel(frame: CGRect(x:second_box.frame.minX+0.05*second_box.frame.width, y:4*second_box.frame.height/12+second_box.frame.minY, width:0.2*second_box.frame.width, height:second_box.frame.height/12))
        iq_label1.text = iq_string1
        iq_label1.font = UIFont(name:"HelveticaNeue-Bold", size: 200.0)
        iq_label1.adjustsFontSizeToFitWidth = true
        iq_label1.numberOfLines = 1
        iq_label1.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        iq_label1.minimumScaleFactor = 16/ranking_label1.font.pointSize
        iq_label1.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(iq_label1)
        
        fb_login_label = UILabel(frame: CGRect(x:0, y:0, width:0.9*second_box.frame.width, height:second_box.frame.height/6))
        fb_login_label.center = CGPoint(x: screen_width/2, y: second_box.frame.minY+0.6*second_box.frame.height)
        fb_login_label.text = fb_string
        fb_login_label.font = UIFont(name:"HelveticaNeue-Bold", size: 50.0)
        fb_login_label.adjustsFontSizeToFitWidth = true
        fb_login_label.numberOfLines = 1
        fb_login_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        fb_login_label.minimumScaleFactor = 19/ranking_label1.font.pointSize
        fb_login_label.textAlignment = NSTextAlignment.Center
        fb_login_label.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(fb_login_label)
        
        let fb_login: UIImage = UIImage(named: "btn_fb_login_normal.png")!
        btn_fb_login.highlighted = false
        btn_fb_login.contentMode = UIViewContentMode.ScaleAspectFit
        btn_fb_login.setImage(fb_login, forState: UIControlState.Normal)
        btn_fb_login.setImage(UIImage(named: "btn_fb_login_pressed.png"), forState: UIControlState.Highlighted)
        btn_fb_login.frame.size.height = second_box.frame.height/6
        btn_fb_login.frame.size.width = 4*btn_fb_login.frame.height
        btn_fb_login.center = CGPointMake(screen_width/2, 10*second_box.frame.height/12+second_box.frame.minY)
        scrollView.addSubview(btn_fb_login)
        
        
        
        var third_box: UIImageView
        third_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width + second_box.frame.maxY, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        third_box.backgroundColor = UIColorFromRGB(0xfffb96)
        third_box.layer.cornerRadius = 10
        third_box.alpha = 0.5
        scrollView.addSubview(third_box)
        var btn_purchase_1: UIImageView
        btn_purchase_1 = UIImageView(image: UIImage(named: "btn_product_money_1_disable.png"))
        btn_purchase_1.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_1.frame.size.width = first_box.frame.width/4
        btn_purchase_1.center = CGPointMake(third_box.frame.minX + third_box.frame.width/6,(third_box.frame.maxY+third_box.frame.minY)/2)
        btn_purchase_1.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_1)
        var btn_purchase_2: UIImageView
        btn_purchase_2 = UIImageView(image: UIImage(named: "btn_product_money_2_disable.png"))
        btn_purchase_2.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_2.frame.size.width = first_box.frame.width/4
        btn_purchase_2.center = CGPointMake(third_box.frame.minX + 3*third_box.frame.width/6,(third_box.frame.maxY+third_box.frame.minY)/2)
        btn_purchase_2.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_2)
        var btn_purchase_3: UIImageView
        btn_purchase_3 = UIImageView(image: UIImage(named: "btn_product_money_3_disable.png"))
        btn_purchase_3.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_3.frame.size.width = first_box.frame.width/4
        btn_purchase_3.center = CGPointMake(third_box.frame.minX + 5*third_box.frame.width/6,(third_box.frame.maxY+third_box.frame.minY)/2)
        btn_purchase_3.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_3)
        
        
        var forth_box: UIImageView
        forth_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width + third_box.frame.maxY, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        forth_box.backgroundColor = UIColorFromRGB(0xfffb96)
        forth_box.layer.cornerRadius = 10
        forth_box.alpha = 0.5
        scrollView.addSubview(forth_box)
        var btn_purchase_4: UIImageView
        btn_purchase_4 = UIImageView(image: UIImage(named: "btn_product_level_1_disable.png"))
        btn_purchase_4.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_4.frame.size.width = first_box.frame.width/4
        btn_purchase_4.center = CGPointMake(forth_box.frame.minX + forth_box.frame.width/6,(forth_box.frame.maxY+forth_box.frame.minY)/2)
        btn_purchase_4.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_4)
        var btn_purchase_5: UIImageView
        btn_purchase_5 = UIImageView(image: UIImage(named: "btn_product_level_2_disable.png"))
        btn_purchase_5.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_5.frame.size.width = first_box.frame.width/4
        btn_purchase_5.center = CGPointMake(forth_box.frame.minX + 3*forth_box.frame.width/6,(forth_box.frame.maxY+forth_box.frame.minY)/2)
        btn_purchase_5.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_5)
        var btn_purchase_6: UIImageView
        btn_purchase_6 = UIImageView(image: UIImage(named: "btn_product_level_3_disable.png"))
        btn_purchase_6.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_6.frame.size.width = first_box.frame.width/4
        btn_purchase_6.center = CGPointMake(forth_box.frame.minX + 5*forth_box.frame.width/6,(forth_box.frame.maxY+forth_box.frame.minY)/2)
        btn_purchase_6.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_6)
        

    }
    
    func btn_fail_next_click(button: UIButton) {
        button.highlighted = true
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("State3_PreparingViewController")
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
