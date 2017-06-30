//
//  gameStartVC.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit
import SwiftyJSON

class gameStartVC: UIViewController {
    
    
    @IBOutlet weak var TesttextView: UITextView!
    
    

    var version:[String] = ["口病","AA"]
    
    
    func loadJsonToArys(){
        //read file
        let filePath=Bundle.main.path(forResource: "data", ofType:
            "json")
        let data1:Data
        let json_parsed:JSON
        do{
            
            
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            print(json_parsed["version"])
            let aa =
                json_parsed["version"].arrayValue.map{$0.stringValue}
            print(aa)
            self.version=aa
        }catch{
            print(error.localizedDescription)
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        TesttextView.text!=String(describing: version)
        
        TesttextView.backgroundColor = UIColor(red: 90/255, green: 30/255, blue: 30/255, alpha: 1)
        TesttextView.font = UIFont.systemFont(ofSize: 20, weight: 20)
        TesttextView.textColor = UIColor.white
        TesttextView.font = UIFont.boldSystemFont(ofSize: 20)
        TesttextView.font = UIFont(name: "Verdana", size: 17)
//        Make web links clickable
        TesttextView.isSelectable = true
        TesttextView.isEditable = true
        TesttextView.dataDetectorTypes = UIDataDetectorTypes.link
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
