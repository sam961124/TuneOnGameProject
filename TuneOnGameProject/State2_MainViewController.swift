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
        
        top_bar = UIImageView(frame: CGRect( x: 0, y: 0, width: screen_width, height: screen_width/7))
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
        
        //main page scroll area code from here
        scrollView = UIScrollView(frame: CGRect( x:0, y:5*top_bar.frame.height/4, width: screen_width, height: screen_height-5*top_bar.frame.height/4))
        scrollView.contentSize = CGSizeMake(view.frame.width, 2 * view.frame.width+15)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(scrollView)
        //end here
        
        //box
        var first_box: UIImageView
        first_box = UIImageView(frame: CGRect(x:15, y:15, width:scrollView.frame.width-30, height:(scrollView.frame.width-30)/2))
        first_box.backgroundColor = UIColorFromRGB(0xfffb96)
        first_box.layer.cornerRadius = 10
        first_box.alpha = 0.5
        scrollView.addSubview(first_box)
        var start_doll: UIImageView
        start_doll = UIImageView(image: UIImage(named: "doll_upper.png"))
        start_doll.frame.size.height = 10*first_box.frame.height/11
        start_doll.center = CGPointMake(15+3*first_box.frame.width/4, 15+first_box.frame.height-(start_doll.frame.height/2))
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
        btn_start_game.center = CGPointMake(15+first_box.frame.width/4, 15+first_box.frame.height/2)
        scrollView.addSubview(btn_start_game)
        btn_start_game.addTarget(self, action: "btn_fail_next_click:", forControlEvents: UIControlEvents.TouchUpInside)

        
        
        var second_box: UIImageView
        second_box = UIImageView(frame: CGRect(x:15, y:30+first_box.frame.height, width:scrollView.frame.width-30, height:(scrollView.frame.width-30)/2))
        second_box.backgroundColor = UIColorFromRGB(0xfffb96)
        second_box.layer.cornerRadius = 10
        second_box.alpha = 0.5
        scrollView.addSubview(second_box)
        
        var third_box: UIImageView
        third_box = UIImageView(frame: CGRect(x:15, y:45+first_box.frame.height+second_box.frame.height, width:scrollView.frame.width-30, height:(scrollView.frame.width-30)/2))
        third_box.backgroundColor = UIColorFromRGB(0xfffb96)
        third_box.layer.cornerRadius = 10
        third_box.alpha = 0.5
        scrollView.addSubview(third_box)
        var btn_purchase_1: UIImageView
        btn_purchase_1 = UIImageView(image: UIImage(named: "btn_product_money_1_disable.png"))
        btn_purchase_1.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_1.frame.size.width = first_box.frame.width/4
        btn_purchase_1.center = CGPointMake(screen_width/2 - btn_purchase_1.frame.width - first_box.frame.width/16, 45 + first_box.frame.height + second_box.frame.height + third_box.frame.height/2)
        btn_purchase_1.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_1)
        var btn_purchase_2: UIImageView
        btn_purchase_2 = UIImageView(image: UIImage(named: "btn_product_money_2_disable.png"))
        btn_purchase_2.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_2.frame.size.width = first_box.frame.width/4
        btn_purchase_2.center = CGPointMake(screen_width/2, 45 + first_box.frame.height + second_box.frame.height + third_box.frame.height/2)
        btn_purchase_2.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_2)
        var btn_purchase_3: UIImageView
        btn_purchase_3 = UIImageView(image: UIImage(named: "btn_product_money_3_disable.png"))
        btn_purchase_3.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_3.frame.size.width = first_box.frame.width/4
        btn_purchase_3.center = CGPointMake(screen_width/2 + btn_purchase_1.frame.width + first_box.frame.width/16, 45 + first_box.frame.height + second_box.frame.height + third_box.frame.height/2)
        btn_purchase_3.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_3)
        
        
        var forth_box: UIImageView
        forth_box = UIImageView(frame: CGRect(x:15, y:60+first_box.frame.height+second_box.frame.height+third_box.frame.height, width:scrollView.frame.width-30, height:(scrollView.frame.width-30)/2))
        forth_box.backgroundColor = UIColorFromRGB(0xfffb96)
        forth_box.layer.cornerRadius = 10
        forth_box.alpha = 0.5
        scrollView.addSubview(forth_box)
        var btn_purchase_4: UIImageView
        btn_purchase_4 = UIImageView(image: UIImage(named: "btn_product_level_1_disable.png"))
        btn_purchase_4.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_4.frame.size.width = first_box.frame.width/4
        btn_purchase_4.center = CGPointMake(screen_width/2 - btn_purchase_1.frame.width - first_box.frame.width/16, 60 + first_box.frame.height + second_box.frame.height + third_box.frame.height + forth_box.frame.height/2)
        btn_purchase_4.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_4)
        var btn_purchase_5: UIImageView
        btn_purchase_5 = UIImageView(image: UIImage(named: "btn_product_level_2_disable.png"))
        btn_purchase_5.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_5.frame.size.width = first_box.frame.width/4
        btn_purchase_5.center = CGPointMake(screen_width/2, 60 + first_box.frame.height + second_box.frame.height + third_box.frame.height + forth_box.frame.height/2)
        btn_purchase_5.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_5)
        var btn_purchase_6: UIImageView
        btn_purchase_6 = UIImageView(image: UIImage(named: "btn_product_level_3_disable.png"))
        btn_purchase_6.frame.size.height = 4*first_box.frame.height/5
        btn_purchase_6.frame.size.width = first_box.frame.width/4
        btn_purchase_6.center = CGPointMake(screen_width/2 + btn_purchase_1.frame.width + first_box.frame.width/16, 60 + first_box.frame.height + second_box.frame.height + third_box.frame.height + forth_box.frame.height/2)
        btn_purchase_6.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(btn_purchase_6)
        

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
