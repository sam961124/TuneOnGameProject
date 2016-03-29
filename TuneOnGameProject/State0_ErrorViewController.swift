//
//  State0_ErrorViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State0_ErrorViewController: ViewController {
    
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        
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
        
        //gradient_color code from here
        let top_color = UIColorFromRGB(0x4a7fa8)
        let buttom_color = UIColorFromRGB(0xb1ebf2)
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [top_color.CGColor, buttom_color.CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        //end here
        
        //txt_fail code from here
        var txt_fail:UIImageView
        txt_fail = UIImageView(image: UIImage(named: "txt_fail.png"))
        txt_fail.frame.size.height = screen_height
        txt_fail.frame.size.width = screen_width/3
        txt_fail.center = CGPointMake(screen_width/2, 0.22*screen_height)
        txt_fail.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(txt_fail)
        //end here
        
        //shadow code from here
        let shadow_image = UIImage(named: "shadow.png")
        let center: [CGFloat] = [9/120, 9/60, 14/60, 18/60, 42/60, 46/60, 51/60, 111/120]
        for i in 0...7 {
            let shadow: UIImageView = UIImageView(image: shadow_image)
            shadow.frame.size.width = screen_width/30
            shadow.frame.size.height = (screen_width/30)*(shadow_image!.size.height)/(shadow_image!.size.width)
            shadow.contentMode = UIViewContentMode.ScaleAspectFit
            shadow.center = CGPointMake(screen_width*center[i], (screen_width*5/28)+(shadow.frame.size.height/2))
            self.view.addSubview(shadow)
        }
        //end here
        
        //btn_fail_next code from here
        let btn_fail_next: UIButton = UIButton()
        let fail_next: UIImage = UIImage(named: "btn_fail_next_normal.png")!
        btn_fail_next.highlighted = false
        btn_fail_next.contentMode = UIViewContentMode.ScaleAspectFit
        btn_fail_next.setImage(fail_next, forState: UIControlState.Normal)
        btn_fail_next.setImage(UIImage(named: "btn_fail_next_pressed.png"), forState: UIControlState.Highlighted)
        btn_fail_next.frame.size.width = screen_width/2
        btn_fail_next.frame.size.height = (screen_width/2)*(fail_next.size.height)/(fail_next.size.width)
        btn_fail_next.center = CGPointMake(screen_width/2, 0.42*screen_height)
        self.view.addSubview(btn_fail_next)
        btn_fail_next.addTarget(self, action: "btn_fail_next_click:", forControlEvents: UIControlEvents.TouchUpInside)
        //end here
        
        //star_blue code from here
        var star_blue: UIImageView
        star_blue = UIImageView(image: UIImage(named: "star_blue.png"))
        star_blue.frame.size.height = screen_height
        star_blue.frame.size.width = screen_width*9/10
        star_blue.frame.size.height = (screen_width*9/10)*(star_blue.image?.size.height)!/(star_blue.image?.size.width)!
        star_blue.center = CGPointMake(screen_width/2, screen_height*37/40)
        star_blue.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(star_blue)
        //end here
        
        //doll_shock code from here
        var doll_shock: UIImageView
        doll_shock = UIImageView(image: UIImage(named: "doll_shock.png"))
        doll_shock.frame.size.width = 0.35*screen_width
        doll_shock.frame.size.height = (0.35*screen_width)*(doll_shock.image?.size.height)!/(doll_shock.image?.size.width)!
        doll_shock.center = CGPointMake(0.28*screen_width, (screen_height*37/40)-(doll_shock.frame.size.height/2)+(star_blue.frame.size.height/2))
        doll_shock.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(doll_shock)
        //end here
        
        //dialog code from here
        dialog = UIImageView(image: UIImage(named: "dialog.png"))
        dialog.frame.size.width = 1.2*doll_shock.frame.width
        dialog.frame.size.height = screen_width/2*(dialog.image?.size.height)!/(dialog.image?.size.width)!
        dialog.center = CGPointMake(doll_shock.frame.maxX+dialog.frame.width/2,doll_shock.frame.minY+0.3*doll_shock.frame.height)
        dialog.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(dialog)
        
        //dialog label
        let dialog_string = "手機說它網路沒開,檢查一下吧!"
        dialog_label = UILabel(frame: CGRect(x:0, y:0, width:0.7*dialog.frame.width, height:0.9*dialog.frame.height))
        dialog_label.center = CGPoint(x: (dialog.frame.minX + dialog.frame.maxX)/2, y: 0.495*(dialog.frame.minY + dialog.frame.maxY))
        dialog_label.text = dialog_string
        dialog_label.font = UIFont(name:"HelveticaNeue-Bold", size: screen_width*0.05)
        dialog_label.numberOfLines = 3
        dialog_label.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        dialog_label.textAlignment = NSTextAlignment.Center
        dialog_label.textColor = UIColorFromRGB(0x820c0c)
        self.view.addSubview(dialog_label)
        //end here
        
        // Do any additional setup after loading the view.
    }
    
    func btn_fail_next_click(button: UIButton) {
        button.highlighted = true
        TurnPage(1)
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
