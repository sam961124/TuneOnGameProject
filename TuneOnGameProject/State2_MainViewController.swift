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
        scrollView.contentSize = CGSizeMake(view.frame.width, 2 * view.frame.height)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(scrollView)
        
        var first_box: UIImageView
        
        

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
