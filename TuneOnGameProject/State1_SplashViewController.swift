//
//  State1_SplashViewController.swift
//  TuneOnGameProject
//
//  Created by JustinKuo on 2016/3/16.
//  Copyright © 2016年 IM_IOS_CodingGroup. All rights reserved.
//

import UIKit

class State1_SplashViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //constant
        let screen_width = view.frame.width
        let screen_height = view.frame.height
        
        //tune_on_title code from here
        var tune_on_title: UIImageView
        tune_on_title = UIImageView(image: UIImage(named: "title.png"))
        tune_on_title.frame.size.height = screen_height
        tune_on_title.frame.size.width = screen_width/2
        tune_on_title.center = CGPointMake(screen_width/2, screen_height/2)
        tune_on_title.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(tune_on_title)
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
