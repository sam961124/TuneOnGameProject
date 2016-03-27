//
//  State3_PreparingViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State3_PreparingViewController: ViewController {
    
    var dialog: UIImageView!
    var dialog_label: UILabel!

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.dialog.frame.size.width = self.dialog.frame.size.width*2
            self.dialog.frame.size.height = self.dialog.frame.size.height*2
            self.dialog_label.frame.size.width = self.dialog_label.frame.size.width*2
            self.dialog_label.frame.size.height = self.dialog_label.frame.size.height*2
            }, completion: nil)
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
            
            //btn_success_next code from here
            let btn_success_next: UIButton = UIButton()
            let success_next: UIImage = UIImage(named: "btn_success_next_normal.png")!
            btn_success_next.highlighted = false
            btn_success_next.contentMode = UIViewContentMode.ScaleAspectFit
            btn_success_next.setImage(success_next, forState: UIControlState.Normal)
            btn_success_next.setImage(UIImage(named: "btn_success_next_pressed.png"), forState: UIControlState.Highlighted)
            btn_success_next.frame.size.width = screen_width/2
            btn_success_next.frame.size.height = (screen_width/2)*(success_next.size.height)/(success_next.size.width)
            btn_success_next.center = CGPointMake(screen_width/2, 0.42*screen_height)
            self.view.addSubview(btn_success_next)
            btn_success_next.addTarget(self, action: "btn_success_next_click:", forControlEvents: UIControlEvents.TouchUpInside)
            //end here
            
            //star_orange code from here
            var star_orange: UIImageView
            star_orange = UIImageView(image: UIImage(named: "star_orange.png"))
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
            dialog = UIImageView(image: UIImage(named: "dialog.png"))
            dialog.frame.size.width = 1.2*doll_smile.frame.width
            dialog.frame.size.height = screen_width/2*(dialog.image?.size.height)!/(dialog.image?.size.width)!
            dialog.center = CGPointMake(doll_smile.frame.maxX+dialog.frame.width/2,doll_smile.frame.minY+0.3*doll_smile.frame.height)
            dialog.contentMode = UIViewContentMode.ScaleAspectFit
            self.view.addSubview(dialog)
            
            //dialog label
            let dialog_string = "準備好答題了嗎?"
            dialog_label = UILabel(frame: CGRect(x:0, y:0, width:0.9*dialog.frame.width, height:0.9*dialog.frame.height))
            dialog_label.center = CGPoint(x: (dialog.frame.minX + dialog.frame.maxX)/2, y: 0.495*(dialog.frame.minY + dialog.frame.maxY))
            dialog_label.text = dialog_string
            dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: screen_width*0.05)
            dialog_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
            dialog_label.minimumScaleFactor = 16/dialog_label.font.pointSize
            dialog_label.textAlignment = NSTextAlignment.Center
            dialog_label.textColor = UIColorFromRGB(0x820c0c)
            self.view.addSubview(dialog_label)
            
            // Do any additional setup after loading the view.
        }
    
        func btn_success_next_click(button: UIButton) {
            button.highlighted = true
            TurnPage(0)
        }
    
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            dialog.frame.size.width = dialog.frame.size.width/2
            dialog.frame.size.height = dialog.frame.size.height/2
            dialog_label.frame.size.width = dialog_label.frame.size.width/2
            dialog_label.frame.size.height = dialog_label.frame.size.height/2
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
