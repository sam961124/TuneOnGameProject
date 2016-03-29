//
//  State6_QuizViewController.swift
//  TuneOnGameProject
//
//  Created by 李尚恩 on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State6_QuizViewController: ViewController {
    //item button
    let btn_playback: UIButton = UIButton()
    let btn_friend: UIButton = UIButton()
    let btn_remove: UIButton = UIButton()
    let btn_submit: UIButton = UIButton()
    let btn_start_use: UIButton = UIButton()
    var btn_choice: Array<UIButton> = []
    
    //pop_up window element
    var pop_up_background: UIView!
    var pop_up_view: UIView!
    
    var item_image: UIImageView = UIImageView(image: UIImage(named: "home.png"))
    var current_item: UIImage = UIImage()
    
    var item_name_label: UILabel!
    var item_intro_label: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        //background code form here
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "brick.png")!)
        //end here
        
        //top_bar code from here
        var top_bar: UIImageView
        var exp_bar: UIImageView
        var level_bar: UIImageView
        var real_exp_bar: UIImageView
        var money_bar: UIImageView
        var btn_home: UIImageView
        let exp_rate:CGFloat = (CGFloat(right_count) - pow(CGFloat(level),2))/(pow(CGFloat(level+1),2) - pow(CGFloat(level),2))
        
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
        
        btn_home = UIImageView(image: UIImage(named: "home.png"))
        btn_home.frame.size.width = 0.8*level_bar.frame.minX
        btn_home.frame.size.height = 0.8*level_bar.frame.minX*(btn_home.image?.size.height)!/(btn_home.image?.size.width)!
        btn_home.center = CGPointMake(level_bar.frame.minX/2, top_bar.frame.height/2)
        btn_home.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_home)
        
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
        let exp_percent = String(Int(exp_rate*100))
        let exp_string = "EXP (" + exp_percent + "/100)"
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
        
        //red_bar code from here
        var red_bar: UIImageView
        red_bar = UIImageView(frame: CGRect(x:0, y:5*screen_height/6, width:screen_width, height:screen_height/6))
        self.view.addSubview(red_bar)
        let top_color = UIColorFromRGB(0xc64242)
        let buttom_color = UIColorFromRGB(0x962b2b)
        let gradient = CAGradientLayer()
        gradient.frame = red_bar.frame
        gradient.colors = [top_color.CGColor, buttom_color.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        //end here
        
        //question code from here
        var question_box: UIImageView
        var pink_round: UIImageView
        question_box = UIImageView(image: UIImage(named: "q-frame.png"))
        question_box.frame.size.width = 0.8*screen_width
        question_box.frame.size.height = (0.8*screen_width)*(question_box.image?.size.height)!/(question_box.image?.size.width)!
        question_box.center = CGPointMake(screen_width/2, 0.2*screen_height+top_bar.frame.maxY)
        question_box.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(question_box)
        pink_round = UIImageView(image: UIImage(named: "pink-rounded.png"))
        pink_round.frame.size.width = question_box.frame.width/4
        pink_round.frame.size.height = question_box.frame.height/5
        pink_round.center = CGPointMake(question_box.frame.maxX-0.35*pink_round.frame.size.width, question_box.frame.maxY)
        self.view.addSubview(pink_round)
        
        let counting_star = 2
        let star_image = UIImage(named: "star_200_200.png")
        for i in 0...counting_star {
            let star: UIImageView = UIImageView(image:star_image)
            star.frame.size.height = question_box.frame.height/4
            star.frame.size.width = (question_box.frame.height/4)*(star_image!.size.width/star_image!.size.height)
            star.contentMode = UIViewContentMode.ScaleAspectFit
            star.center = CGPointMake(question_box.frame.minX+star.frame.width*CGFloat(i)*1.05, 0.99*question_box.frame.maxY)
            self.view.addSubview(star)
        }
        
        var question_label: UILabel
        question_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*question_box.frame.width, height:0.8*question_box.frame.height))
        question_label.center = CGPointMake((question_box.frame.minX+question_box.frame.maxX)/2, (question_box.frame.minY+question_box.frame.maxY)/2)
        question_label.text = question
        question_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.05*screen_width)
        question_label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        question_label.numberOfLines = 0
        question_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        question_label.textAlignment = NSTextAlignment.Center
        question_label.textColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(question_label)
        
        var reward_label: UILabel
        let reward = "200"
        let reward_string = reward + " G"
        reward_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*pink_round.frame.width, height:0.7*pink_round.frame.height))
        reward_label.center = CGPointMake((pink_round.frame.minX+pink_round.frame.maxX)/2, (pink_round.frame.minY+pink_round.frame.maxY)/2)
        reward_label.text = reward_string
        reward_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.035*screen_width)
        reward_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        reward_label.textAlignment = NSTextAlignment.Center
        reward_label.textColor = UIColorFromRGB(0xffe155)
        self.view.addSubview(reward_label)
        
        //end here
        
        //four item code from here
        let lock1: UIImageView = UIImageView(image: UIImage(named: "lock.png"))
        let lock2: UIImageView = UIImageView(image: UIImage(named: "lock.png"))
        let lock3: UIImageView = UIImageView(image: UIImage(named: "lock.png"))
        let lock4: UIImageView = UIImageView(image: UIImage(named: "lock.png"))
        let item_width = screen_width/6
        let item_y = 11*screen_height/12
        let playback_image: UIImage = UIImage(named: "btn_item_playback_normal.png")!
        let item_height = (screen_width/6)*playback_image.size.height/playback_image.size.width
        //lock
        lock1.frame.size.width = 0.1*screen_width
        lock1.contentMode = UIViewContentMode.ScaleAspectFit
        lock2.frame.size.width = 0.1*screen_width
        lock2.contentMode = UIViewContentMode.ScaleAspectFit
        lock3.frame.size.width = 0.1*screen_width
        lock3.contentMode = UIViewContentMode.ScaleAspectFit
        lock4.frame.size.width = 0.1*screen_width
        lock4.contentMode = UIViewContentMode.ScaleAspectFit
        
        //item playback
        if freeitem_amount > 0 && level >= 10 {
            btn_playback.setBackgroundImage(playback_image, forState: UIControlState.Normal)
            btn_playback.setBackgroundImage(UIImage(named: "btn_item_playback_pressed.png"), forState: UIControlState.Highlighted)
        }
        else{
            btn_playback.setBackgroundImage(UIImage(named: "btn_item_playback_disable.png"), forState: UIControlState.Normal)
        }
        btn_playback.contentMode = UIViewContentMode.ScaleAspectFit
        btn_playback.frame.size.height = item_height
        btn_playback.frame.size.width = item_width
        btn_playback.center = CGPointMake(screen_width/8, item_y)
        self.view.addSubview(btn_playback)
        btn_playback.addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        if level < 10{
            lock1.center = CGPointMake(btn_playback.frame.width/2, btn_playback.frame.height/2)
            self.btn_playback.addSubview(lock1)
        }
        
        //item friend
        if freeitem_amount > 0 && level >= 6{
            btn_friend.setBackgroundImage(UIImage(named: "btn_item_friend_normal.png"), forState: UIControlState.Normal)
            btn_friend.setBackgroundImage(UIImage(named: "btn_item_friend_pressed.png"), forState: UIControlState.Highlighted)
        }
        else{
            btn_friend.setBackgroundImage(UIImage(named: "btn_item_friend_disable.png"), forState: UIControlState.Normal)
        }
        btn_friend.frame.size.height = item_height
        btn_friend.frame.size.width = item_width
        btn_friend.center = CGPointMake(3*screen_width/8, item_y)
        btn_friend.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_friend)
        btn_friend.addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        if level < 6{
            lock2.center = CGPointMake(btn_friend.frame.width/2, btn_friend.frame.height/2)
            self.btn_friend.addSubview(lock2)
        }
        
        //item remove
        if freeitem_amount > 0 && level >= 15{
            btn_remove.setBackgroundImage(UIImage(named: "btn_item_remove_normal.png"), forState: UIControlState.Normal)
            btn_remove.setBackgroundImage(UIImage(named: "btn_item_remove_pressed.png"), forState: UIControlState.Highlighted)
        }
        else{
            btn_remove.setBackgroundImage(UIImage(named: "btn_item_remove_disable.png"), forState: UIControlState.Normal)
        }
        btn_remove.frame.size.height = item_height
        btn_remove.frame.size.width = item_width
        btn_remove.center = CGPointMake(5*screen_width/8, item_y)
        btn_remove.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_remove)
        btn_remove.addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        if level < 15{
            lock3.center = CGPointMake(btn_remove.frame.width/2, btn_remove.frame.height/2)
            self.btn_remove.addSubview(lock3)
        }
        
        //item submit
        btn_submit.setBackgroundImage(UIImage(named: "btn_item_submit_disable.png"), forState: UIControlState.Normal)
        //btn_submit.setImage(UIImage(named: "btn_item_submit_pressed.png"), forState: UIControlState.Highlighted)
        btn_submit.frame.size.height = item_height
        btn_submit.frame.size.width = item_width
        btn_submit.center = CGPointMake(7*screen_width/8, item_y)
        btn_submit.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_submit)
        btn_submit.addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        lock4.center = CGPointMake(btn_submit.frame.width/2, btn_submit.frame.height/2)
        self.btn_submit.addSubview(lock4)
        //end here
        
        //choice code from here
        let choice_area = red_bar.frame.minY - question_box.frame.maxY
        for i in 0...3{
            let button: UIButton = UIButton()
            button.setImage(UIImage(named: "btn_choice_normal.png"), forState: UIControlState.Normal)
            button.setImage(UIImage(named: "btn_choice_pressed.png"), forState: UIControlState.Highlighted)
            button.setImage(UIImage(named: "btn_choice_disable.png"), forState: UIControlState.Selected)
            button.frame.size.height = choice_area/6
            button.frame.size.width = button.frame.size.height*5
            button.center = CGPointMake(screen_width/2, question_box.frame.maxY + CGFloat(i+1)*0.2*choice_area)
            btn_choice.insert(button, atIndex: i)
            self.view.addSubview(btn_choice[i])
            btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        //choice label
        var choice1_label: UILabel
        var choice2_label: UILabel
        var choice3_label: UILabel
        var choice4_label: UILabel
        let choice1_string = "哈囉你好嗎"
        let choice2_string = "衷心感謝"
        let choice3_string = "珍重再見"
        let choice4_string = "期待再相逢"
        choice1_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice[0].frame.width, height:0.5*btn_choice[0].frame.height))
        choice1_label.center = CGPointMake(screen_width/2, (btn_choice[0].frame.minY+btn_choice[0].frame.maxY)/2)
        choice1_label.text = choice1_string
        choice1_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice1_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice1_label.textAlignment = NSTextAlignment.Center
        choice1_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice1_label)
        
        choice2_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice[0].frame.width, height:0.5*btn_choice[0].frame.height))
        choice2_label.center = CGPointMake(screen_width/2, (btn_choice[1].frame.minY+btn_choice[1].frame.maxY)/2)
        choice2_label.text = choice2_string
        choice2_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice2_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice2_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice2_label.textAlignment = NSTextAlignment.Center
        choice2_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice2_label)
        choice3_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice[0].frame.width, height:0.5*btn_choice[0].frame.height))
        choice3_label.center = CGPointMake(screen_width/2, (btn_choice[2].frame.minY+btn_choice[2].frame.maxY)/2)
        choice3_label.text = choice3_string
        choice3_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice3_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice3_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice3_label.textAlignment = NSTextAlignment.Center
        choice3_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice3_label)
        choice4_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice[0].frame.width, height:0.5*btn_choice[0].frame.height))
        choice4_label.center = CGPointMake(screen_width/2, (btn_choice[3].frame.minY+btn_choice[3].frame.maxY)/2)
        choice4_label.text = choice4_string
        choice4_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice4_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice4_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice4_label.textAlignment = NSTextAlignment.Center
        choice4_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice4_label)
        
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
        let cancel_use: UIImage = UIImage(named: "btn_cancel_use_normal.png")!
        
        btn_cancel_use.setBackgroundImage(cancel_use, forState: UIControlState.Normal)
        btn_cancel_use.setBackgroundImage(UIImage(named: "btn_cancel_use_pressed.png"), forState: UIControlState.Highlighted)
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
        btn_cancel_use.addTarget(self, action: #selector(State6_QuizViewController.btn_cancel_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
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
        // Do any additional setup after loading the view.
    }
    
    func btn_item_click(button: UIButton) {
        let freeitem_amount_string = String(freeitem_amount)
        //item_image
        btn_start_use.hidden = false
        if button == btn_playback{
            item_image = UIImageView(image: UIImage(named: "btn_item_playback_normal.png"))
            item_image.frame.size.width = pop_up_view.frame.width/4
            item_image.frame.size.height = pop_up_view.frame.width/4
            item_image.contentMode = UIViewContentMode.ScaleAspectFit
            item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
            self.pop_up_view.addSubview(item_image)
            
            if freeitem_amount > 0 && level >= 10{
                item_name_label.text = "重看一次(免費道具)"
                item_intro_label.text = "無限次重看影片或圖片，使用一個免費道具，還有" + freeitem_amount_string + "個"
                
            }
            else if freeitem_amount == 0 && level >= 10{
                item_name_label.text = "重看一次(購買道具)"
                item_intro_label.text = "無限次重看影片或圖片，購買此道具，請支付200G"
            }
            else{
                item_name_label.text = "重看一次(無法使用)"
                item_intro_label.text = "無限次重看影片或圖片，需要Lv10以上"
                btn_start_use.hidden = true
            }
            item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
            item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
        }
        else if button == btn_remove{
            item_image = UIImageView(image: UIImage(named: "btn_item_remove_normal.png"))
            item_image.frame.size.width = pop_up_view.frame.width/4
            item_image.frame.size.height = pop_up_view.frame.width/4
            item_image.contentMode = UIViewContentMode.ScaleAspectFit
            item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
            self.pop_up_view.addSubview(item_image)
            
            if freeitem_amount > 0 && level >= 15{
                item_name_label.text = "減少選項(免費道具)"
                item_intro_label.text = "從四選一變成二選一，使用一個免費道具，還有" + freeitem_amount_string + "個"
                
            }
            else if freeitem_amount == 0 && level >= 15{
                item_name_label.text = "減少選項(購買道具)"
                item_intro_label.text = "從四選一變成二選一，購買此道具，請支付200G"
            }
            else{
                item_name_label.text = "減少選項(無法使用)"
                item_intro_label.text = "從四選一變成二選一，需要Lv15以上"
                btn_start_use.hidden = true
            }
            item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
            item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
        }
        else if button == btn_friend{
            item_image = UIImageView(image: UIImage(named: "btn_item_friend_normal.png"))
            item_image.frame.size.width = pop_up_view.frame.width/4
            item_image.frame.size.height = pop_up_view.frame.width/4
            item_image.contentMode = UIViewContentMode.ScaleAspectFit
            item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
            self.pop_up_view.addSubview(item_image)
            
            if freeitem_amount > 0 && level >= 6{
                item_name_label.text = "玩家記錄(免費道具)"
                item_intro_label.text = "看其他玩家曾經選過的答案與次數，使用一個免費道具，還有" + freeitem_amount_string + "個"
                
            }
            else if freeitem_amount == 0 && level >= 6{
                item_name_label.text = "玩家記錄(購買道具)"
                item_intro_label.text = "看其他玩家曾經選過的答案與次數，購買此道具，請支付100G"
            }
            else{
                item_name_label.text = "玩家記錄(無法使用)"
                item_intro_label.text = "看其他玩家曾經選過的答案與次數，需要Lv6以上"
                btn_start_use.hidden = true
            }
            item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
            item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
        }
        else if button == btn_submit{
            item_image = UIImageView(image: UIImage(named: "btn_item_submit_normal.png"))
            item_image.frame.size.width = pop_up_view.frame.width/4
            item_image.frame.size.height = pop_up_view.frame.width/4
            item_image.contentMode = UIViewContentMode.ScaleAspectFit
            item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
            self.pop_up_view.addSubview(item_image)
            
            item_name_label.text = "幫忙出題(無法使用)"
            item_intro_label.text = "上傳題目給其他玩家玩，不用花G還能賺G，需要Lv101以上。將在v2.0版開放。"
            item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
            item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
            btn_start_use.hidden = true
        }
        self.pop_up_view.addSubview(item_name_label)
        self.pop_up_view.addSubview(item_intro_label)
        button.highlighted = true
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 1
        })
        pop_up_background.hidden = false
    }
    
    func btn_answer_click(button: UIButton){
        let correct = 1
        button.highlighted = true
        if button == btn_choice[correct-1]{
            TurnPage(7)
        }
        else{
            TurnPage(8)
        }
    }
    
    func btn_cancel_click(button: UIButton) {
        button.highlighted = true
        pop_up_background.hidden = true
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 0
        })
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
