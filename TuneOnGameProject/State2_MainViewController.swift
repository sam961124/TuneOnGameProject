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
    
    //pop_up window element
    var pop_up_background: UIView!
    var pop_up_view: UIView!
    var item_image: UIImageView = UIImageView(image: UIImage(named: "home.png"))
    var current_item: UIImage = UIImage()
    let btn_start_use: UIButton = UIButton()
    var item_name_label: UILabel!
    var item_intro_label: UILabel!
    
    var btn_purchase: Array<UIButton> = []
    let btn_purchase_4: UIButton = UIButton()
    let btn_purchase_5: UIButton = UIButton()
    let btn_purchase_6: UIButton = UIButton()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //end here
    }
    

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
        var real_exp_bar: UIImageView
        var level_bar: UIImageView
        var money_bar: UIImageView
        let exp_rate:CGFloat = ExpRate()
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
        let money_string = "\(money) G"
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
        
        //fb button
        let btn_fb: UIButton = UIButton()
        let fb_logo: UIImage = UIImage(named: "fb_logo.png")!
        btn_fb.setImage(fb_logo, forState: UIControlState.Normal)
        btn_fb.frame.size.width = 0.6*level_bar.frame.minX
        btn_fb.frame.size.height = 0.6*level_bar.frame.minX*(fb_logo.size.height)/(fb_logo.size.width)
        btn_fb.center = CGPointMake(level_bar.frame.minX/2, top_bar.frame.height/2)
        btn_fb.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_fb)
        btn_fb.addTarget(self, action: #selector(State2_MainViewController.btn_fb_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
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
        start_doll.frame.size.width = (0.95*first_box.frame.height)*(start_doll.image?.size.width)!/(start_doll.image?.size.height)!
        start_doll.center = CGPointMake(first_box.frame.minX+3*first_box.frame.width/4, first_box.frame.maxY-start_doll.frame.height/2)
        start_doll.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(start_doll)
        let btn_start_game: UIButton = UIButton()
        let start_game: UIImage = UIImage(named: "btn_start_answer_normal.png")!
        btn_start_game.highlighted = false
        btn_start_game.contentMode = UIViewContentMode.ScaleAspectFit
        btn_start_game.setImage(start_game, forState: UIControlState.Normal)
        btn_start_game.setImage(UIImage(named: "btn_start_answer_pressed.png"), forState: UIControlState.Highlighted)
        btn_start_game.frame.size.width = 2*first_box.frame.width/5
        btn_start_game.frame.size.height = (btn_start_game.frame.size.width)*(start_game.size.height)/(start_game.size.width)
        btn_start_game.center = CGPointMake(first_box.frame.minX+first_box.frame.width/4, first_box.frame.minY+first_box.frame.height/2)
        scrollView.addSubview(btn_start_game)
        btn_start_game.addTarget(self, action: #selector(State2_MainViewController.btn_start_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        var second_box: UIImageView
        second_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width + first_box.frame.maxY, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        second_box.backgroundColor = UIColorFromRGB(0xfffb96)
        second_box.layer.cornerRadius = 10
        second_box.alpha = 0.5
        scrollView.addSubview(second_box)
        
        //ranking & IQ & FB_login
        let btn_fb_login: UIButton = UIButton()
        var ranking_label1: UILabel
        var ranking_label2: UILabel
        var iq_label1: UILabel
        var iq_label2: UILabel
        var fb_login_label: UILabel
        let ranking_string1 = "你的線上排名"
//        let player_ranking = "20"
//        let player_amount = "600"
        var correct_rate: Float = 0
        let ranking_string2 = "-- / --"
        let iq_string1 = "你的IQ"
        var iq_string2: String = String()
        let fb_string = "缺金幣?想升級?看排行?登入臉書進入進階模式!"
        if right_count+wrong_count != 0{
            correct_rate = Float(right_count)/Float(right_count + wrong_count)
        }
        ranking_label1 = UILabel(frame: CGRect(x:second_box.frame.minX+0.05*second_box.frame.width, y:second_box.frame.height/12+second_box.frame.minY, width:0.4*second_box.frame.width, height:second_box.frame.height/10))
        ranking_label1.text = ranking_string1
        ranking_label1.font = UIFont(name:"HelveticaNeue-Bold", size: 0.05*screen_width)
        ranking_label1.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        ranking_label1.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(ranking_label1)
        
        ranking_label2 = UILabel(frame: CGRect(x:second_box.frame.minX+0.7*second_box.frame.width, y:second_box.frame.height/12+second_box.frame.minY, width:0.25*second_box.frame.width, height:second_box.frame.height/10))
        ranking_label2.text = ranking_string2
        ranking_label2.font = UIFont(name:"HelveticaNeue-Bold", size: 0.05*screen_width)
        ranking_label2.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        ranking_label2.textAlignment = NSTextAlignment.Right
        ranking_label2.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(ranking_label2)
        
        iq_label1 = UILabel(frame: CGRect(x:second_box.frame.minX+0.05*second_box.frame.width, y:4*second_box.frame.height/12+second_box.frame.minY, width:0.2*second_box.frame.width, height:second_box.frame.height/10))
        iq_label1.text = iq_string1
        iq_label1.font = UIFont(name:"HelveticaNeue-Bold", size: 0.05*screen_width)
        iq_label1.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        iq_label1.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(iq_label1)
        
        
        if level > 2{
            iq_string2 = String(Int(sqrt(correct_rate)*200))
            iq_label2 = UILabel(frame: CGRect(x:second_box.frame.minX+0.7*second_box.frame.width, y:4*second_box.frame.height/12+second_box.frame.minY, width:0.25*second_box.frame.width, height:second_box.frame.height/10))
            iq_label2.font = UIFont(name:"HelveticaNeue-Bold", size: 0.05*screen_width)
        }
        else{
            iq_string2 = "將在Lv3開啟"
            iq_label2 = UILabel(frame: CGRect(x:second_box.frame.minX+0.5*second_box.frame.width, y:4*second_box.frame.height/12+second_box.frame.minY, width:0.45*second_box.frame.width, height:second_box.frame.height/10))
            iq_label2.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        }
        iq_label2.text = iq_string2
        iq_label2.textAlignment = NSTextAlignment.Right
        iq_label2.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        iq_label2.textColor = UIColorFromRGB(0x5c5c5c)
        scrollView.addSubview(iq_label2)
        
        fb_login_label = UILabel(frame: CGRect(x:0, y:0, width:0.9*second_box.frame.width, height:second_box.frame.height/6))
        fb_login_label.center = CGPoint(x: screen_width/2, y: second_box.frame.minY+0.6*second_box.frame.height)
        fb_login_label.text = fb_string
        fb_login_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.038*screen_width)
        fb_login_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
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
        
        for i in 1...3{
            let button: UIButton = UIButton()
            if fb_status == true{
                button.setBackgroundImage(UIImage(named: "btn_product_money_\(i).png"), forState: UIControlState.Normal)
            }else{
                button.setBackgroundImage(UIImage(named: "btn_product_money_\(i)_disable.png"), forState: UIControlState.Normal)
            }
            button.frame.size.height = 4*first_box.frame.height/5
            button.frame.size.width = first_box.frame.width/4
            button.center = CGPointMake(third_box.frame.minX + (2*CGFloat(i) - 1)*third_box.frame.width/6, (third_box.frame.maxY+third_box.frame.minY)/2)
            button.contentMode = UIViewContentMode.ScaleAspectFit
            btn_purchase.append(button)
            scrollView.addSubview(btn_purchase[i-1])
            btn_purchase[i-1].addTarget(self, action: #selector(State2_MainViewController.btn_purchase_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        var forth_box: UIImageView
        let item_level = [6, 10, 15]
        forth_box = UIImageView(frame: CGRect(x:0.05*screen_width, y:0.05*screen_width + third_box.frame.maxY, width:0.9*scrollView.frame.width, height:0.9*scrollView.frame.width/2))
        forth_box.backgroundColor = UIColorFromRGB(0xfffb96)
        forth_box.layer.cornerRadius = 10
        forth_box.alpha = 0.5
        scrollView.addSubview(forth_box)
        
        for i in 1...3{
            let button = UIButton()
            if fb_status && level < item_level[i-1]{
                button.setBackgroundImage(UIImage(named: "btn_product_level_\(i).png"), forState: UIControlState.Normal)
            }
            else{
                button.setBackgroundImage(UIImage(named: "btn_product_level_\(i)_disable.png"), forState: UIControlState.Normal)
            }
            button.frame.size.height = 4*first_box.frame.height/5
            button.frame.size.width = first_box.frame.width/4
            button.center = CGPointMake(forth_box.frame.minX + (CGFloat(i)*2-1)*forth_box.frame.width/6,(forth_box.frame.maxY+forth_box.frame.minY)/2)
            button.contentMode = UIViewContentMode.ScaleAspectFit
            btn_purchase.append(button)
            scrollView.addSubview(btn_purchase[i+2])
            btn_purchase[i+2].addTarget(self, action: #selector(State2_MainViewController.btn_purchase_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        //pop up view code
        pop_up_background = UIView(frame: CGRect(x: 0, y: 0, width: screen_width, height: screen_height))
        pop_up_background.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        pop_up_background.hidden = true
        self.view.addSubview(pop_up_background)
        
        pop_up_view = UIView(frame: CGRect(x: 0, y: 0, width: 0.8*screen_width, height: 1.2*screen_width))
        pop_up_view.center = CGPointMake(screen_width/2, screen_height/2)
        pop_up_view.backgroundColor = UIColor(patternImage: UIImage(named: "background_youtube_small.png")!)
        pop_up_view.alpha = 0
        self.view.addSubview(pop_up_view)
        
        
        //doll
        var doll_smile: UIImageView
        doll_smile = UIImageView(image: UIImage(named: "doll_smile.png"))
        doll_smile.frame.size.width = 0.35*screen_width
        doll_smile.frame.size.height = (0.35*screen_width)*(doll_smile.image?.size.height)!/(doll_smile.image?.size.width)!
        doll_smile.center = CGPointMake(0.26*pop_up_view.frame.width, 0.75*pop_up_view.frame.height)
        doll_smile.contentMode = UIViewContentMode.ScaleAspectFit
        self.pop_up_view.addSubview(doll_smile)
        
        //button
        let btn_cancel_use: UIButton = UIButton()
        let cancel_use: UIImage = UIImage(named: "btn_fragment_back.png")!
        
        btn_cancel_use.setBackgroundImage(cancel_use, forState: UIControlState.Normal)
        btn_cancel_use.frame.size.height = 0.3*doll_smile.frame.height
        btn_cancel_use.frame.size.width = (0.3*doll_smile.frame.height)*(cancel_use.size.width)/(cancel_use.size.height)
        btn_cancel_use.center = CGPointMake(0.7*pop_up_view.frame.width, 0.75*pop_up_view.frame.height)
        btn_cancel_use.contentMode = UIViewContentMode.ScaleAspectFit
        
        btn_start_use.setBackgroundImage(UIImage(named: "btn_start_use_normal.png"), forState: UIControlState.Normal)
        btn_start_use.setBackgroundImage(UIImage(named: "btn_start_use_pressed.png"), forState: UIControlState.Highlighted)
        btn_start_use.frame.size.height = 0.3*doll_smile.frame.height
        btn_start_use.frame.size.width = (0.3*doll_smile.frame.height)*(cancel_use.size.width)/(cancel_use.size.height)
        btn_start_use.center = CGPointMake(0.7*pop_up_view.frame.width, doll_smile.frame.minY + 0.15*doll_smile.frame.height)
        btn_start_use.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.pop_up_view.addSubview(btn_cancel_use)
        self.pop_up_view.addSubview(btn_start_use)
        btn_cancel_use.addTarget(self, action: #selector(State2_MainViewController.btn_cancel_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //label
        item_name_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*pop_up_view.frame.width, height:0.12*pop_up_view.frame.height))
        item_name_label.font = UIFont(name:"Helvetica", size: 0.06*screen_width)
        item_name_label.numberOfLines = 1
        item_name_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        item_name_label.textAlignment = NSTextAlignment.Center
        item_name_label.textColor = UIColorFromRGB(0xfba928)
        
        item_intro_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*pop_up_view.frame.width, height:0.12*pop_up_view.frame.height))
        item_intro_label.font = UIFont(name:"Helvetica", size: 0.04*screen_width)
        item_intro_label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        item_intro_label.numberOfLines = 0
        item_intro_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        item_intro_label.textColor = UIColorFromRGB(0xfba928)

    }
    func btn_purchase_click(button: UIButton) {
        
        item_image = UIImageView(image: UIImage(named: "fb_logo.png"))
        item_image.frame.size.width = pop_up_view.frame.width/4
        item_image.frame.size.height = pop_up_view.frame.width/4
        item_image.contentMode = UIViewContentMode.ScaleAspectFit
        item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
        item_image.hidden = true
        self.pop_up_view.addSubview(item_image)
        
        if !fb_status{
            item_name_label.text = "無法購買本商品"
            item_intro_label.text = "對不起啦!只有用臉書註冊過的玩家，才能購買商品的說。對了，我不會在你臉書發任何訊息的唷!"
            item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
            item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
            self.pop_up_view.addSubview(item_name_label)
            self.pop_up_view.addSubview(item_intro_label)
            btn_start_use.hidden = true
        }
        else {
            if button == btn_purchase[0]{
                
            }
            else if button == btn_purchase[1]{
                
            }
            else if button == btn_purchase[2]{
                
            }
            else if button == btn_purchase[3]{
                if level >= 6{
                    item_name_label.text = "無法購買本商品"
                    item_intro_label.text = "你的等級已經超過6級了喔"
                    item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
                    self.pop_up_view.addSubview(item_name_label)
                    self.pop_up_view.addSubview(item_intro_label)
                    btn_start_use.hidden = true
                }
            }
            else if button == btn_purchase[4]{
                if level >= 10{
                    item_name_label.text = "無法購買本商品"
                    item_intro_label.text = "你的等級已經超過10級了喔"
                    item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
                    self.pop_up_view.addSubview(item_name_label)
                    self.pop_up_view.addSubview(item_intro_label)
                    btn_start_use.hidden = true
                }
            }
            else if button == btn_purchase[5]{
                if level >= 15{
                    item_name_label.text = "無法購買本商品"
                    item_intro_label.text = "你的等級已經超過15級了喔"
                    item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
                    self.pop_up_view.addSubview(item_name_label)
                    self.pop_up_view.addSubview(item_intro_label)
                    btn_start_use.hidden = true
                }
            }
            //purchase
        }
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 1.0
        })
        button.highlighted = true
        pop_up_background.hidden = false
    }
    
    func btn_fb_click(button: UIButton) {
        
        btn_start_use.hidden = false
        item_image = UIImageView(image: UIImage(named: "fb_logo.png"))
        item_image.frame.size.width = pop_up_view.frame.width/4
        item_image.frame.size.height = pop_up_view.frame.width/4
        item_image.contentMode = UIViewContentMode.ScaleAspectFit
        item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
        self.pop_up_view.addSubview(item_image)
    
        item_name_label.text = "推薦"
        item_intro_label.text = "肯在臉書上幫我推薦一下嗎?我會送你兩個免費道具當謝禮唷!"
        item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
        item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
        self.pop_up_view.addSubview(item_name_label)
        self.pop_up_view.addSubview(item_intro_label)
        
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 1.0
        })
        button.highlighted = true
        pop_up_background.hidden = false
    }
    
    func btn_cancel_click(button: UIButton) {
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 0
        })
        button.highlighted = true
        pop_up_background.hidden = true
    }

    
    func btn_start_answer_click(button: UIButton) {
        button.highlighted = true
        let status = defaults.boolForKey("Answering")
        if status{
            qid = defaults.objectForKey("qid") as! String
            eid = defaults.objectForKey("eid") as! String
            category = defaults.objectForKey("category") as! String
            quiz_level = defaults.objectForKey("quiz_level") as! String
            youtube_id = defaults.objectForKey("youtube_id") as! String
            question = defaults.objectForKey("question") as! String
            correct = defaults.integerForKey("correct")
            for i in 0...3{
                choice_string[i] = defaults.objectForKey("choice_string\(i)") as! String
                sel[i] = defaults.integerForKey("sel_\(i)")
            }
            if youtube_id == ""{
                image_url = defaults.objectForKey("image_url") as! String
                number = 5
            }
            else{
                number = 4
            }
            TurnPage(6)
        }
        else{
            TurnPage(3)
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
