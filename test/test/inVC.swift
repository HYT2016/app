//
//  inVC.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class inVC: UIViewController {


    
    @IBAction func loginBtn(_ sender: UIButton) {
            let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")as! MainNavigationController
            present(mainNavigationController, animated: true, completion: nil)

    }
   
    
    
    //    let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")as! MainNavigationController
//    present(mainNavigationController, animated: true, completion: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    
    

    
}
