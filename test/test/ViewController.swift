//
//  ViewController.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var segment: UISegmentedControl!
 
    @IBOutlet weak var image: UIImageView!
    @IBAction func segment(_ sender: Any) {
        
        switch segment.selectedSegmentIndex {
        case 0:
            image.image=UIImage(named: "01")
        
            
        case 1:
            
        image.image=UIImage(named: "02")
            
        default:
            break
        }
        
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定預設按鈕 
        segment.selectedSegmentIndex = 1
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

