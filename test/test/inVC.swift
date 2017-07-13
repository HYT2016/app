//
//  inVC.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class inVC: UIViewController {

//    var gradientLayer: CAGradientLayer!
    
    
//    func createGradientLayer() {
//        gradientLayer = CAGradientLayer()
//        
//        gradientLayer.frame = self.view.bounds
//        
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
//        
//        self.view.layer.addSublayer(gradientLayer)
//    }

    
    @IBAction func loginBtn(_ sender: UIButton) {
            let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")as! MainNavigationController
            present(mainNavigationController, animated: true, completion: nil)

    }
   
    
    
    //    let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController")as! MainNavigationController
//    present(mainNavigationController, animated: true, completion: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createGradientLayer()
        
        //        兩個漸層顏色
        let color1 = UIColor(red: 115, green: 165, blue: 239, alpha: 1)
        let color2 = UIColor(red: 67, green: 141, blue: 252, alpha: 1)
        //      漸層的CAlayer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor,color2.cgColor]
        //      把漸層layer加入畫面中
        self.view.layer.insertSublayer(gradient, at: 0)
//        self.view.backgroundColor = UIColor.green

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
