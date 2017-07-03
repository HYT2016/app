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
    
    @IBOutlet weak var testTextView2: UITextView!
//        var version:[String] = ["",""]
    var version:String = ""
    func loadJsonToArys(){
        //read file
        let filePath=Bundle.main.path(forResource: "data", ofType:
            "json")
        var data1:Data
        var json_parsed:JSON
        
        
        
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            
            
//            let path: [JSONSubscriptType] = [1,"version",2,"categorires",3,"口病",4,"口解",5,"口微",6,"口胚"]
//            let aa = json_parsed[path].string
            
           let aa = json_parsed["version"].stringValue
            print(aa)
            self.version=aa
            //            self.version=[aa]
        }catch{
            print(error.localizedDescription)
        }
        
        
        
    }

    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonToArys()
        testTextView2.text!=String(describing: version)
        
        testTextView2.backgroundColor = UIColor(red: 225/255, green: 227/255, blue: 132/255, alpha: 1)
        testTextView2.font = UIFont.systemFont(ofSize: 20, weight: 20)
        testTextView2.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)
        testTextView2.font = UIFont.boldSystemFont(ofSize: 20)
        testTextView2.font = UIFont(name: "Verdana", size: 17)
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
