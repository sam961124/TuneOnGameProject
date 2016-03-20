//
//  State0_ErrorViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State0_ErrorViewController: ViewController {
    
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
        txt_fail.center = CGPointMake(screen_width/2, screen_height*1/5)
        txt_fail.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(txt_fail)
        //end here
        
        //shadow code from here
        var shadow_1:UIImageView
        var shadow_2:UIImageView
        var shadow_3:UIImageView
        var shadow_4:UIImageView
        var shadow_5:UIImageView
        var shadow_6:UIImageView
        var shadow_7:UIImageView
        var shadow_8:UIImageView
        shadow_1 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_1.frame.size.width = screen_width/30
        shadow_1.frame.size.height = (screen_width/30)*(shadow_1.image?.size.height)!/(shadow_1.image?.size.width)!
        shadow_1.center = CGPointMake(screen_width*9/120, (screen_width*5/28)+(shadow_1.frame.size.height/2))
        shadow_1.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_1)
        shadow_2 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_2.frame.size.width = screen_width/30
        shadow_2.frame.size.height = (screen_width/30)*(shadow_2.image?.size.height)!/(shadow_2.image?.size.width)!
        shadow_2.center = CGPointMake(screen_width*9/60, (screen_width*5/28)+(shadow_2.frame.size.height/2))
        shadow_2.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_2)
        shadow_3 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_3.frame.size.width = screen_width/30
        shadow_3.frame.size.height = (screen_width/30)*(shadow_3.image?.size.height)!/(shadow_3.image?.size.width)!
        shadow_3.center = CGPointMake(screen_width*14/60, (screen_width*5/28)+(shadow_3.frame.size.height/2))
        shadow_3.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_3)
        shadow_4 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_4.frame.size.width = screen_width/30
        shadow_4.frame.size.height = (screen_width/30)*(shadow_4.image?.size.height)!/(shadow_4.image?.size.width)!
        shadow_4.center = CGPointMake(screen_width*18/60, (screen_width*5/28)+(shadow_4.frame.size.height/2))
        shadow_4.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_4)
        shadow_5 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_5.frame.size.width = screen_width/30
        shadow_5.frame.size.height = (screen_width/30)*(shadow_5.image?.size.height)!/(shadow_5.image?.size.width)!
        shadow_5.center = CGPointMake(screen_width*42/60, (screen_width*5/28)+(shadow_5.frame.size.height/2))
        shadow_5.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_5)
        shadow_6 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_6.frame.size.width = screen_width/30
        shadow_6.frame.size.height = (screen_width/30)*(shadow_6.image?.size.height)!/(shadow_6.image?.size.width)!
        shadow_6.center = CGPointMake(screen_width*46/60, (screen_width*5/28)+(shadow_6.frame.size.height/2))
        shadow_6.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_6)
        shadow_7 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_7.frame.size.width = screen_width/30
        shadow_7.frame.size.height = (screen_width/30)*(shadow_7.image?.size.height)!/(shadow_7.image?.size.width)!
        shadow_7.center = CGPointMake(screen_width*51/60, (screen_width*5/28)+(shadow_7.frame.size.height/2))
        shadow_7.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_7)
        shadow_8 = UIImageView(image: UIImage(named: "shadow.png"))
        shadow_8.frame.size.width = screen_width/30
        shadow_8.frame.size.height = (screen_width/30)*(shadow_8.image?.size.height)!/(shadow_8.image?.size.width)!
        shadow_8.center = CGPointMake(screen_width*111/120, (screen_width*5/28)+(shadow_8.frame.size.height/2))
        shadow_8.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(shadow_8)
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
        btn_fail_next.center = CGPointMake(screen_width/2, screen_height*2/5)
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
        doll_shock.frame.size.width = screen_width*3/8
        doll_shock.frame.size.height = (screen_width*3/8)*(doll_shock.image?.size.height)!/(doll_shock.image?.size.width)!
        doll_shock.center = CGPointMake(screen_width/4, (screen_height*37/40)-(doll_shock.frame.size.height/2)+(star_blue.frame.size.height/2))
        doll_shock.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(doll_shock)
        //end here
        
        //dialog code from here
        var dialog: UIImageView
        dialog = UIImageView(image: UIImage(named: "dialog.png"))
        dialog.frame.size.height = screen_height
        dialog.frame.size.width = screen_width/2
        dialog.center = CGPointMake(screen_width*11/16, screen_height*29/40)
        dialog.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(dialog)
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
