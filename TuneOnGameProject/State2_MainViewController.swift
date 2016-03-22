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
        
        var forth_box: UIImageView
        forth_box = UIImageView(frame: CGRect(x:15, y:60+first_box.frame.height+second_box.frame.height+third_box.frame.height, width:scrollView.frame.width-30, height:(scrollView.frame.width-30)/2))
        forth_box.backgroundColor = UIColorFromRGB(0xfffb96)
        forth_box.layer.cornerRadius = 10
        forth_box.alpha = 0.5
        scrollView.addSubview(forth_box)
        

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
