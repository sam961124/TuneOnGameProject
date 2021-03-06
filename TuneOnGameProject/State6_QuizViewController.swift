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
    var money_label: UILabel = UILabel()
    var btn_item: Array<UIButton> = []
    let btn_submit: UIButton = UIButton()
    let btn_start_use: UIButton = UIButton()
    var btn_choice: Array<UIButton> = []
    var note: Array<UIImageView> = []
    var lock: Array<UIImageView> = []
    var noteLabel: Array<UILabel> = []
    var choice_label: Array<UILabel> = []
    let btn_image = ["playback", "friend", "remove", "submit"]
    let item_level = [10, 6, 15]
    let item_money = [200, 100, 200]
    
    //pop_up window element
    var pop_up_background: UIView!
    var pop_up_view: UIView!
    
    var item_image: UIImageView = UIImageView(image: UIImage(named: "home.png"))
    var current_item: UIImage = UIImage()
    
    var item_name_label: UILabel!
    var item_intro_label: UILabel!
    var freeitem_amount = defaults.integerForKey("FreeItemAmount")
    var friend = defaults.boolForKey("friend")
    var remove = defaults.boolForKey("remove")
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        defaults.setBool(true, forKey: "Answering")
        //background code form here
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "brick.png")!)
        //end here
        
        //top_bar code from here
        var top_bar: UIImageView
        var exp_bar: UIImageView
        var level_bar: UIImageView
        var real_exp_bar: UIImageView
        var money_bar: UIImageView
        let btn_home: UIButton = UIButton()
        let home: UIImage = UIImage(named: "home.png")!
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
        
        let counting_star = Int(quiz_level)!/100 - 1
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
        question_label.textColor = UIColorFromRGB(0xfba928)
        self.view.addSubview(question_label)
        
        var reward_label: UILabel
        let reward_string = "\(quiz_level) G"
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
        let item_y = 11*screen_height/12
        let item_width = screen_width/6
        let playback_image: UIImage = UIImage(named: "btn_item_playback_normal.png")!
        let item_height = (screen_width/6)*playback_image.size.height/playback_image.size.width
        //lock
        for i in 0...3{
            let temp = UIImageView(image: UIImage(named: "lock.png"))
            temp.frame.size.width = 0.1*screen_width
            temp.contentMode = UIViewContentMode.ScaleAspectFit
            lock.insert(temp, atIndex: i)
        }
        
        for i in 0...2{
            let temp = UIButton()
            temp.setBackgroundImage(UIImage(named: "btn_item_\(btn_image[i])_normal.png"), forState: UIControlState.Normal)
            temp.setBackgroundImage(UIImage(named: "btn_item_\(btn_image[i])_pressed.png"), forState: UIControlState.Highlighted)
            temp.setBackgroundImage(UIImage(named: "btn_item_\(btn_image[i])_disable.png"), forState: UIControlState.Selected)
            temp.contentMode = UIViewContentMode.ScaleAspectFit
            temp.frame.size.height = item_height
            temp.frame.size.width = item_width
            temp.center = CGPointMake((CGFloat(i)*2+1)*screen_width/8, item_y)
            btn_item.insert(temp, atIndex: i)
            self.view.addSubview(btn_item[i])
            btn_item[i].addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        update_four_item_status()
        //item submit
        btn_submit.setBackgroundImage(UIImage(named: "btn_item_submit_disable.png"), forState: UIControlState.Normal)
        //btn_submit.setImage(UIImage(named: "btn_item_submit_pressed.png"), forState: UIControlState.Highlighted)
        btn_submit.frame.size.height = item_height
        btn_submit.frame.size.width = item_width
        btn_submit.center = CGPointMake(7*screen_width/8, item_y)
        btn_submit.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_submit)
        btn_submit.addTarget(self, action: #selector(State6_QuizViewController.btn_item_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        lock[3].center = CGPointMake(btn_submit.frame.width/2, btn_submit.frame.height/2)
        self.btn_submit.addSubview(lock[3])
        //end here
        
        //choice code from here
        let remove_value = defaults.integerForKey("remove_value")
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
            var iMage: UIImageView
            iMage = UIImageView(image: UIImage(named: "note.png"))
            iMage.frame.size.height = choice_area/6
            //iMage.frame.size.width = (iMage.image?.size.width)!/(iMage.image?.size.height)!
            iMage.center = CGPointMake(button.frame.minX + 9/10 * button.frame.size.width, question_box.frame.maxY + CGFloat(i+1)*0.2*choice_area)
            iMage.contentMode = UIViewContentMode.ScaleAspectFit
            iMage.hidden = true
            note.insert(iMage, atIndex: i)
            self.view.addSubview(note[i])
        }
        
        if(remove == true){
            for i in 0...3{
                btn_choice[i].selected = true
                btn_choice[i].removeTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
            for i in 0...3{
                if(i == correct){
                    btn_choice[i].selected = false
                    btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                }
                else if(i > correct && i == (remove_value+1)) || (i < correct && i == remove_value){
                    btn_choice[i].selected = false
                    btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                }
            }
        }
        
        //choice label
        for i in 0...3 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0.8*btn_choice[i].frame.width, height: 0.5*btn_choice[i].frame.height))
            label.center = CGPointMake(screen_width/2, (btn_choice[i].frame.minY+btn_choice[i].frame.maxY)/2)
            label.text = choice_string[i]
            label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
            label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColorFromRGB(0x820c0c)
            choice_label.insert(label, atIndex: i)
            self.view.addSubview(choice_label[i])
        }
        let total_sel = sel[0]+sel[1]+sel[2]+sel[3]
        for i in 0...3{
            let label = UILabel(frame: CGRect(x: 0, y:0, width: 0.8 * note[i].frame.width, height: 0.8 * note[i].frame.height))
            label.center = CGPointMake(note[i].frame.minX + note[i].frame.width/2, note[i].frame.minY + note[i].frame.height/2)
            label.font = UIFont(name:"HelveticaNeue-Bold", size: 0.04*screen_width)
            if(total_sel == 0){
                label.text = "25%"
            }
            else{
                label.text = "\((100*sel[i]) / total_sel)%"
            }
            label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColorFromRGB(0x820c0c)
            label.hidden = true
            noteLabel.insert(label, atIndex: i)
            self.view.addSubview(noteLabel[i])

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
        
        // state control
        if(friend == true){
            for i in 0...3{
                note[i].hidden = false
                noteLabel[i].hidden = false
            }
        }
    }
    
    func update_four_item_status(){
        for i in 0...2{
            if defaults.boolForKey(btn_image[i]) && i != 0{
                btn_item[i].selected = true
            }
            else if !((level >= item_level[i] && money >= item_money[i]) || freeitem_amount > 0){
                btn_item[i].selected = true
            }
            if level < item_level[i] && freeitem_amount < 1{
                lock[i].center = CGPointMake(btn_item[i].frame.width/2, btn_item[i].frame.height/2)
                self.btn_item[i].addSubview(lock[i])
            }
        }
    }
    func btn_home_click(button: UIButton){
        TurnPage(2)
    }
    
    func btn_item_click(button: UIButton) {
        //item_image
        let function = ["重看一次", "玩家記錄", "減少選項"]
        let description = ["無限次重看影片或圖片", "看其他玩家曾經選過的答案與次數", "從四選一變成二選一"]
        btn_start_use.hidden = false
        for i in 0...2{
            if button == btn_item[i]{
                item_image = UIImageView(image: UIImage(named: "btn_item_\(btn_image[i])_normal.png"))
                item_image.frame.size.width = pop_up_view.frame.width/4
                item_image.frame.size.height = pop_up_view.frame.width/4
                item_image.contentMode = UIViewContentMode.ScaleAspectFit
                item_image.center = CGPointMake(pop_up_view.frame.width/2, 0.12*pop_up_view.frame.height)
                self.pop_up_view.addSubview(item_image)
                item_name_label.center = CGPointMake(pop_up_view.frame.width/2, item_image.frame.maxY+0.05*pop_up_view.frame.height)
                if defaults.boolForKey(btn_image[i]){
                    item_name_label.text = "\(function[i])(已使用)"
                    item_intro_label.text = "\(description[i])。這個道具已經使用過囉！"
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
                    if i != 0{
                        btn_start_use.hidden = true
                    }
                }
                else if freeitem_amount > 0{
                    item_name_label.text = "\(function[i])(免費道具)"
                    item_intro_label.text = "\(description[i])，使用一個免費道具，還有\(freeitem_amount)個"
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.02*pop_up_view.frame.height)
                }
                else if level < item_level[i]{
                    item_name_label.text = "\(function[i])(無法使用)"
                    item_intro_label.text = "\(description[i])，需花費\(item_money[i])G。需要Lv\(item_level[i])以上。PS.用首頁左上角的FB按鈕點個讚，送兩個免費道具唷!"
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
                    btn_start_use.hidden = true
                }
                else{
                    item_name_label.text = "\(function[i])(購買道具)"
                    item_intro_label.text = "\(description[i])，需花費\(item_money[i])G。PS.用首頁左上角的FB按鈕點個讚，送兩個免費道具唷!"
                    item_intro_label.center = CGPointMake(pop_up_view.frame.width/2, item_name_label.frame.maxY+0.04*pop_up_view.frame.height)
                    if money < item_money[i]{
                        btn_start_use.hidden = true
                    }
                }
                break
            }
        }
        
        if button == btn_item[0] && btn_item[0].selected == false{
            btn_start_use.addTarget(self, action: #selector(State6_QuizViewController.btn_playBack_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        else if button == btn_item[1] && btn_item[1].selected == false{
            btn_start_use.addTarget(self, action: #selector(State6_QuizViewController.btn_friend_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        else if button == btn_item[2] && btn_item[2].selected == false{
            btn_start_use.addTarget(self, action: #selector(State6_QuizViewController.btn_remove_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
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
    
    func btn_playBack_click(button: UIButton){
        var number = 0
        if youtube_id == ""{
            number = 5
        }
        else{
            number = 4
        }
        button.highlighted = true
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            button.center.x = self.view.frame.width
            }, completion: nil)
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()){}
        if defaults.boolForKey("playback"){
            
        }
        else if freeitem_amount > 0{
            freeitem_amount -= 1
            defaults.setInteger(freeitem_amount, forKey: "FreeItemAmount")
        }
        else{
            money_label.text = "\(money-200) G"
            action.append(["type": 10, "qid": qid, "param1": 0, "param2": 0])
        }
        defaults.setBool(true, forKey: "playback")
        update_four_item_status()
        TurnPage(number)
    }
    
    func btn_friend_click(button: UIButton){
        button.highlighted = true
        for i in 0...3{
            note[i].hidden = false
            noteLabel[i].hidden = false
        }
        pop_up_background.hidden = true
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 0
        })
        friend = true
        if freeitem_amount > 0{
            freeitem_amount -= 1
            defaults.setInteger(freeitem_amount, forKey: "FreeItemAmount")
        }
        else{
            money_label.text = "\(money-100) G"
            action.append(["type": 11, "qid": qid, "param1": 0, "param2": 0])
        }
        defaults.setBool(true, forKey: "friend")
        update_four_item_status()
    }
    func btn_remove_click(button: UIButton){
        let remove_value = Int(arc4random_uniform(3))
        defaults.setInteger(remove_value, forKey: "remove_value")
        print(remove_value)
        for i in 0...3{
            btn_choice[i].selected = true
            btn_choice[i].removeTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
        for i in 0...3{
            if(i == correct){
                btn_choice[i].selected = false
                btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
            else if(i > correct && i == (remove_value+1)){
                btn_choice[i].selected = false
                btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
            else if(i < correct && i == remove_value){
                btn_choice[i].selected = false
                btn_choice[i].addTarget(self, action: #selector(State6_QuizViewController.btn_answer_click(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
        pop_up_background.hidden = true
        UIView.animateWithDuration(0.2, animations: {
            self.pop_up_view.alpha = 0
        })
        remove = true
        if freeitem_amount > 0{
            freeitem_amount -= 1
            defaults.setInteger(freeitem_amount, forKey: "FreeItemAmount")
        }
        else{
            money_label.text = "\(money-200) G"
            action.append(["type": 12, "qid": qid, "param1": 0, "param2": 0])
        }
        defaults.setBool(true, forKey: "remove")
        update_four_item_status()
    }
    
    func btn_answer_click(button: UIButton){
        button.highlighted = true
        if button == btn_choice[correct]{
            action.append(["type": 1, "qid": qid, "param1": correct+1, "param2": Int(quiz_level)!])
            TurnPage(7)
        }
        else{
            var ans: Int = Int()
            for i in 0...3{
                if button == btn_choice[i]{
                    ans = i+1
                    break
                }
            }
            action.append(["type": 2, "qid": qid, "param1": ans, "param2": Int(quiz_level)!/2])
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
