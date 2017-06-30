//
//  tab bar 2.swift
//  test
//
//  Created by ios135 on 2017/6/30.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class tab_bar_2: UITabBarController {
    
    
    
    
//public func setBadgeTextAttributes(_ textAttributes: [String : AnyObject]?, for state: UIControlState)
//    
//    
//    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        // Override point for customization after application launch.
//        let tabBarController = self.window?.rootViewController as! UITabBarController
        tabBarController?.tabBar.tintColor = UIColor.yellow
        tabBarController?.tabBar.barTintColor = UIColor.blue
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.green
        let textAttributes = [NSForegroundColorAttributeName:UIColor.white]
        for controller in (tabBarController?.viewControllers!)!    {
            controller.tabBarItem.badgeColor = UIColor.orange
            controller.tabBarItem.setBadgeTextAttributes(textAttributes,
                                                         for: .normal)
        }
        return true
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.tintColor = UIColor.yellow
        tabBarController?.tabBar.barTintColor = UIColor.blue
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.green
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
