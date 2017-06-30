//
//  gameStartVC2.swift
//  test
//
//  Created by ios135 on 2017/6/30.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit
import SwiftyJSON
class gameStartVC2: UIViewController {
    
    
    
    
    
    
    var names = [String]()
    
//    func loadJsonToArys(){
//        //read file
//        let filePath=Bundle.main.path(forResource: "aaa", ofType:
//            "json")
////        var data1:Data
////        var json_parsed:JSON
//        
//        var names = [String]()
//        
//        
//        
//        do {
//            if let data = data,
//                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
//                let blogs = json["blogs"] as? [[String: Any]] {
//                for blog in blogs {
//                    if let name = blog["name"] as? String {
//                        names.append(name)
//                    }
//                }
//            }
//        } catch {
//            print("Error deserializing JSON: \(error)")
//        }
//        
//        print(names)
//        
//        
//    }
//    
//    
//    
//    
//    
//    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//self.loadJsonToArys()
//        TesttextView.text!=String(describing: version)
//        
//        TesttextView.backgroundColor = UIColor(red: 225/255, green: 227/255, blue: 132/255, alpha: 1)
//        TesttextView.font = UIFont.systemFont(ofSize: 20, weight: 20)
//        TesttextView.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)
//        TesttextView.font = UIFont.boldSystemFont(ofSize: 20)
//        TesttextView.font = UIFont(name: "Verdana", size: 17)
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
