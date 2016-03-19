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
        
        top_bar = UIImageView(frame: CGRect(x:0, y:0, width:screen_width, height:screen_width/7))
        top_bar.backgroundColor = UIColorFromRGB(0xfba928)
        self.view.addSubview(top_bar)
        
        exp_bar = UIImageView(frame: CGRect(x:0, y:top_bar.frame.height, width:top_bar.frame.width, height:top_bar.frame.height/4))
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
        question_box.frame.size.height = screen_height/4
        question_box.frame.size.width = 4*screen_width/5
        question_box.center = CGPointMake(screen_width/2, screen_width/7+screen_height/6)
        self.view.addSubview(question_box)
        pink_round = UIImageView(image: UIImage(named: "pink-rounded.png"))
        pink_round.frame.size.width = question_box.frame.width/4
        pink_round.frame.size.height = question_box.frame.height/5
        pink_round.center = CGPointMake(0.82*screen_width, question_box.frame.maxY)
        self.view.addSubview(pink_round)
        star = UIImageView(image: UIImage(named: "star_200_200"))
        star.frame.size.height = question_box.frame.height/4
        star.center = CGPointMake(0.12*screen_width, 0.99*question_box.frame.maxY)
        star.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(star)
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
        btn_choice_2.frame.size = btn_choice_1.frame.size
        btn_choice_3.frame.size = btn_choice_1.frame.size
        btn_choice_4.frame.size = btn_choice_1.frame.size
        btn_choice_1.contentMode = UIViewContentMode.ScaleAspectFit
        btn_choice_2.contentMode = UIViewContentMode.ScaleAspectFit
        btn_choice_3.contentMode = UIViewContentMode.ScaleAspectFit
        btn_choice_4.contentMode = UIViewContentMode.ScaleAspectFit
        btn_choice_1.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.2*choice_area)
        btn_choice_2.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.4*choice_area)
        btn_choice_3.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.6*choice_area)
        btn_choice_4.center = CGPointMake(screen_width/2, question_box.frame.maxY + 0.8*choice_area)
        self.view.addSubview(btn_choice_1)
        self.view.addSubview(btn_choice_2)
        self.view.addSubview(btn_choice_3)
        self.view.addSubview(btn_choice_4)
        
        
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
