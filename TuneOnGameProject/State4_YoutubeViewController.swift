//
//  State4_YoutubeViewController.swift
//  TuneOnGameProject
//
//  Created by XX Lee on 2016/3/20.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State4_YoutubeViewController: ViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
        
        //background_youtube code from here
        var background_youtube: UIImageView
        background_youtube = UIImageView(frame: CGRect(x:0, y:top_bar.frame.maxY+0.05*screen_height, width:screen_width, height:0.4*screen_height))
        background_youtube.backgroundColor = UIColor(patternImage: UIImage(named: "background_youtube_small.png")!)
        self.view.addSubview(background_youtube)
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
        
        //doll_normal code from here
        var doll_normal:UIImageView
        doll_normal = UIImageView(image: UIImage(named: "doll_normal.png"))
        doll_normal.frame.size.width = 0.35*screen_width
        doll_normal.frame.size.height = (0.35*screen_width)*(doll_normal.image?.size.height)!/(doll_normal.image?.size.width)!
        doll_normal.center = CGPointMake(0.28*screen_width, (screen_height*37/40)-(doll_normal.frame.size.height/2)+(star_orange.frame.size.height/2))
        doll_normal.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(doll_normal)
        //end here
        
        //play_again and start_answer code from here
        var btn_play_again: UIImageView
        var btn_start_answer: UIImageView
        
        btn_play_again = UIImageView(image: UIImage(named: "btn_play_again_normal.png"))
        btn_start_answer = UIImageView(image: UIImage(named: "btn_start_answer_normal.png"))
        btn_play_again.frame.size.height = 0.3*doll_normal.frame.height
        btn_play_again.frame.size.width = (0.3*doll_normal.frame.height)*(btn_play_again.image?.size.width)!/(btn_play_again.image?.size.height)!
        btn_start_answer.frame.size = btn_play_again.frame.size
        btn_play_again.center = CGPointMake(doll_normal.frame.maxX+0.65*btn_play_again.frame.width, doll_normal.frame.minY+0.5*btn_play_again.frame.height)
        btn_start_answer.center = CGPointMake(doll_normal.frame.maxX+0.65*btn_play_again.frame.width, doll_normal.frame.minY+0.5*doll_normal.frame.height)
        btn_play_again.contentMode = UIViewContentMode.ScaleAspectFit
        btn_start_answer.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(btn_play_again)
        self.view.addSubview(btn_start_answer)
        //end here

    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
