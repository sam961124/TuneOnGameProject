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
        let title_image: UIImage = UIImage(named: "title.png")!
        let Tap = UITapGestureRecognizer(target: self, action: Selector("Tap:"))
        Tap.numberOfTapsRequired = 1
        tune_on_title = UIImageView(image: title_image)
        tune_on_title.frame.size.width = screen_width/2
        tune_on_title.frame.size.height = (screen_width/2)*((title_image.size.height)/(title_image.size.width))
        tune_on_title.center = CGPointMake(screen_width/2, screen_height/2)
        tune_on_title.contentMode = UIViewContentMode.ScaleAspectFit
        tune_on_title.userInteractionEnabled = true
        tune_on_title.addGestureRecognizer(Tap)
        self.view.addSubview(tune_on_title)
        //end here
        
        //welcome_back code from here
//        let welcome_back: UITextView = UITextView()
//        welcome_back.frame.size.height = screen_height/4
//        welcome_back.frame.size.width = screen_width/4
//        welcome_back.text = "歡迎回來"
//        welcome_back.center = CGPointMake(screen_width/2, screen_height*3/4)
//        welcome_back.textColor = UIColor.blackColor()
//        self.view.addSubview(welcome_back)
        //end here
        
        // Do any additional setup after loading the view.
    }

    func Tap(image: UIImageView){
        let nextviewController:UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("State3_PreparingViewController")
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
