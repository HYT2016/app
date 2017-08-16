////
////  ShareVC.swift
////  test
////
////  Created by Root HSZ HSU on 2017/8/17.
////  Copyright © 2017年 Root HSZ HSU. All rights reserved.
////
//
//import UIKit
//import Social
//
//class ShareVC: UIViewController {
//    
//    
//    @IBOutlet weak var noteTextview: UITextView!
//    
//    @IBAction func showShareOptions(sender: AnyObject) {
//        // 如果鍵盤跑出來的話，則隱藏鍵盤
//        if noteTextview.isFirstResponder {
//            noteTextview.resignFirstResponder()
//        }
//        let actionSheet = UIAlertController(title: "", message: "Share your Note", preferredStyle: UIAlertControllerStyle.actionSheet)
//        
//        // 設定分享筆記至 Twitter 的新動作
//        let tweetAction = UIAlertAction(title: "Share on Twitter", style: UIAlertActionStyle.default) { (action) -> Void in
//            
//        }
//        
//        
//        // 設定分享至 Facebook 的新動作
//        let facebookPostAction = UIAlertAction(title: "Share on Facebook", style: UIAlertActionStyle.default) { (action) -> Void in
//            
//        }
//        
//        // 設定顯示 UIActivityViewController 的新動作
//        let moreAction = UIAlertAction(title: "More", style: UIAlertActionStyle.default) { (action) -> Void in
//            
//        }
//        let dismissAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel) { (action) -> Void in
//            
//        }
//        
//        
//        actionSheet.addAction(tweetAction)
//        actionSheet.addAction(facebookPostAction)
//        actionSheet.addAction(moreAction)
//        actionSheet.addAction(dismissAction)
//        
//        present(actionSheet, animated: true, completion: nil)
//    }
//        
//        
//        
//        
//        
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureNoteTextView()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    func configureNoteTextView() {
//        noteTextview.layer.cornerRadius = 8.0
//        noteTextview.layer.borderColor = UIColor(white: 0.75, alpha: 0.5).cgColor
//        noteTextview.layer.borderWidth = 1.2
//    }
//}
//}
