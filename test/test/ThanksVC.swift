//
//  ThanksVC.swift
//  test
//
//  Created by ios135 on 2017/7/13.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit
import Social

class ThanksVC: UIViewController {

    @IBAction func shareBtn(_ sender: Any) {
        //        Alert
        let alert = UIAlertController(title: "Share", message: "Share cougar", preferredStyle: .actionSheet)
        //        first action
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            //            check if users connect to facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText("")
                //                分享粉絲專頁
                post.add(URL(string: "https://sites.google.com/view/cougarbot"))
                post.add(UIImage(named: "cougar.png"))
                
                self.present(post, animated: true, completion: nil)
            }else{
                self.showAlert(service: "Facebook")
            }
        }
        
        //        second action
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            //            check if users connect to facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText("")
                post.add(URL(string: "https://sites.google.com/view/cougarbot"))
                post.add(UIImage(named: "cougar.png"))
                
                self.present(post, animated: true, completion: nil)
            }else{
                self.showAlert(service: "Twitter")
            }
        }
//        UIActivity 的功能
        let actionFour = UIAlertAction(title: "more", style: .default) { (action) in
            let activityVC=UIActivityViewController(activityItems: ["https://sites.google.com/view/cougarbot"], applicationActivities: nil)
//            移除郵件
//             activityVC.excludedActivityTypes = [UIActivityType.mail]
            activityVC.popoverPresentationController?.sourceView=self.view
            self.present(activityVC, animated: true, completion: nil)
            
        }

        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //        Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionFour)
        alert.addAction(actionThree)
        //        present Alert
        self.present(alert, animated: true, completion: nil)
        
        let activityVC=UIActivityViewController(activityItems: ["https://sites.google.com/view/cougarbot"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView=self.view
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    @IBOutlet weak var thankstestView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "背景 04")!)
       thankstestView.backgroundColor=UIColor(patternImage: UIImage(named: "背景 04")!)
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //將keyboard向下收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
}
