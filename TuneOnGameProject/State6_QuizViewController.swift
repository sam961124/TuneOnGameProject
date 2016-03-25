//
//  State6_QuizViewController.swift
//  TuneOnGameProject
//
//  Created by 李尚恩 on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State6_QuizViewController: ViewController {

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
        btn_home.frame.size.height = 0.8*level_bar.frame.minX*(btn_home.image?.size.height)!/(btn_home.image?.size.width)!
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
        level_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        level_label.numberOfLines = 1
        level_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
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
        money_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        money_label.numberOfLines = 1
        money_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
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
        var star: UIImageView
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
        star = UIImageView(image: UIImage(named: "star_200_200"))
        star.frame.size.height = question_box.frame.height/4
        star.center = CGPointMake(question_box.frame.minX, 0.99*question_box.frame.maxY)
        star.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(star)
        
        var question_label: UILabel
        var question = "請問我們這一家主題曲第一句歌詞是什麼？"
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
        var reward = "200"
        var reward_string = reward + " G"
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
        var btn_playback: UIImageView
        var btn_friend: UIImageView
        var btn_remove: UIImageView
        var btn_submit: UIImageView
        let item_width = screen_width/6
        let item_height = red_bar.frame.height
        let item_y = 11*screen_height/12
        
        btn_playback = UIImageView(image: UIImage(named: "btn_item_playback_normal.png"))
        btn_playback.frame.size.height = item_height
        btn_playback.frame.size.width = item_width
        btn_playback.center = CGPointMake(screen_width/8, item_y)
        btn_playback.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_playback)
        
        btn_friend = UIImageView(image: UIImage(named: "btn_item_friend_normal.png"))
        btn_friend.frame.size.height = item_height
        btn_friend.frame.size.width = item_width
        btn_friend.center = CGPointMake(3*screen_width/8, item_y)
        btn_friend.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_friend)
        
        btn_remove = UIImageView(image: UIImage(named: "btn_item_remove_normal.png"))
        btn_remove.frame.size.height = item_height
        btn_remove.frame.size.width = item_width
        btn_remove.center = CGPointMake(5*screen_width/8, item_y)
        btn_remove.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_remove)
        
        btn_submit = UIImageView(image: UIImage(named: "btn_item_submit_normal.png"))
        btn_submit.frame.size.height = item_height
        btn_submit.frame.size.width = item_width
        btn_submit.center = CGPointMake(7*screen_width/8, item_y)
        btn_submit.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_submit)
        //end here
        
        //choice code from here
        var btn_choice_1: UIImageView
        var btn_choice_2: UIImageView
        var btn_choice_3: UIImageView
        var btn_choice_4: UIImageView
        let choice_area = red_bar.frame.minY - question_box.frame.maxY
        
        btn_choice_1 = UIImageView(image: UIImage(named: "btn_choice_normal.9.png"))
        btn_choice_2 = UIImageView(image: UIImage(named: "btn_choice_normal.9.png"))
        btn_choice_3 = UIImageView(image: UIImage(named: "btn_choice_normal.9.png"))
        btn_choice_4 = UIImageView(image: UIImage(named: "btn_choice_normal.9.png"))
        btn_choice_1.frame.size.height = choice_area/6
        btn_choice_1.frame.size.width = btn_choice_1.frame.size.height*5
        btn_choice_2.frame.size = btn_choice_1.frame.size
        btn_choice_3.frame.size = btn_choice_1.frame.size
        btn_choice_4.frame.size = btn_choice_1.frame.size
        btn_choice_1.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.2*choice_area)
        btn_choice_2.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.4*choice_area)
        btn_choice_3.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.6*choice_area)
        btn_choice_4.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.8*choice_area)
        self.view.addSubview(btn_choice_1)
        self.view.addSubview(btn_choice_2)
        self.view.addSubview(btn_choice_3)
        self.view.addSubview(btn_choice_4)
        
        //choice label
        var choice1_label: UILabel
        var choice2_label: UILabel
        var choice3_label: UILabel
        var choice4_label: UILabel
        let scale: CGFloat = 0.6
        var choice1_string = "哈囉你好嗎"
        var choice2_string = "衷心感謝"
        var choice3_string = "珍重再見"
        var choice4_string = "期待再相逢"
        choice1_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice_1.frame.width, height:0.5*btn_choice_1.frame.height))
        choice1_label.center = CGPointMake(screen_width/2, (btn_choice_1.frame.minY+btn_choice_1.frame.maxY)/2)
        choice1_label.text = choice1_string
        choice1_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice1_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice1_label.textAlignment = NSTextAlignment.Center
        choice1_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice1_label)
        choice2_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice_1.frame.width, height:0.5*btn_choice_1.frame.height))
        choice2_label.center = CGPointMake(screen_width/2, (btn_choice_2.frame.minY+btn_choice_2.frame.maxY)/2)
        choice2_label.text = choice2_string
        choice2_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice2_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice2_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice2_label.textAlignment = NSTextAlignment.Center
        choice2_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice2_label)
        choice3_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice_1.frame.width, height:0.5*btn_choice_1.frame.height))
        choice3_label.center = CGPointMake(screen_width/2, (btn_choice_3.frame.minY+btn_choice_3.frame.maxY)/2)
        choice3_label.text = choice3_string
        choice3_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice3_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice3_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice3_label.textAlignment = NSTextAlignment.Center
        choice3_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice3_label)
        choice4_label = UILabel(frame: CGRect(x:0, y:0, width:0.8*btn_choice_1.frame.width, height:0.5*btn_choice_1.frame.height))
        choice4_label.center = CGPointMake(screen_width/2, (btn_choice_4.frame.minY+btn_choice_4.frame.maxY)/2)
        choice4_label.text = choice4_string
        choice4_label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
        choice4_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        choice4_label.minimumScaleFactor = 8/choice1_label.font.pointSize
        choice4_label.textAlignment = NSTextAlignment.Center
        choice4_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(choice4_label)



        
        
        
        // Do any additional setup after loading the view.
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
