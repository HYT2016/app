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
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定預設按鈕 
        segmentControl.selectedSegmentIndex = 0
            
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

