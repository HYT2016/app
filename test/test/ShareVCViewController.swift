//
//  ShareVCViewController.swift
//  test
//
//  Created by Root HSZ HSU on 2017/8/16.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit
import Social

class ShareVCViewController: UIViewController {
    
    
    @IBOutlet weak var shareTextView: UITextView!

    @IBAction func shareBtn(_ sender: Any) {
//        Alert
        let alert = UIAlertController(title: "Share", message: "Share cougar", preferredStyle: .actionSheet)
//        first action
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
//            check if users connect to facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                
                let twitterComposeVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                // 將筆記文字設定成預設的發文訊息
                if self.shareTextView.text.characters.count <= 140 {
                    twitterComposeVC?.setInitialText("\(self.shareTextView.text)")
                }
                else {
//                    let index = self.shareTextView.text.startIndex.advancedBy(140)
//                    let subText = shareTextView.text.substringToIndex(index)
//                    twitterComposeVC.setInitialText("\(subText)")
                }

                
                
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText("")
//                post.add(UIImage(named: "details.png"))
                
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
                post.setInitialText("HYT")
//                post.add(UIImage(named: "details.png"))
                
                self.present(post, animated: true, completion: nil)
            }else{
                self.showAlert(service: "Twitter")
            }
        }
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
//        Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
//        present Alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNoteTextView()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "背景 04")!)
//        shareTextView.backgroundColor=UIColor(patternImage: UIImage(named: "背景 04")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //將keyboard向下收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configureNoteTextView() {
        shareTextView.layer.cornerRadius = 8.0
        shareTextView.layer.borderColor = UIColor(white: 0.75, alpha: 0.5).cgColor
        shareTextView.layer.borderWidth = 1.2
    }
}
