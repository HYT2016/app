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

    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        
    }
    var version = [String: Int]()
    
    var questions:[JSON]=[]
    
    var indexVC=0
    
    var qID=0
    
    var a=0
    
    var b=0
    
    var preIndex:Int=0
    
   
    let randomNum:UInt32 = arc4random_uniform(100) // range is 0 to 99
    
    func loadJsonToArys(){
        //read file
        let filePath=Bundle.main.path(forResource: "解剖_骨盆會陰", ofType:
            "json")
        var data1:Data
        var json_parsed:JSON
        
        
        
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            questions = json_parsed.arrayValue
            
//            print(questions)
            
        }catch{
            print(error.localizedDescription)
        }
        
//        self.loadQuestionToUser(qID: b)
                self.loadQuestionToUser(qID: Int(randomNum))
        
    }
    
    
    
    
    
    func loadQuestionToUser(qID:Int){
        
        let q = questions[qID]
        let tmpStr=q["題目"].stringValue
        
        self.testTextView2.text=tmpStr
        
        
        
        
        print("tmpStr = \(tmpStr)")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        testTextView2.backgroundColor = UIColor(red: 225/255, green: 227/255, blue: 132/255, alpha: 1)
        testTextView2.font = UIFont.systemFont(ofSize: 20, weight: 20)
        testTextView2.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)
        testTextView2.font = UIFont.boldSystemFont(ofSize: 20)
        testTextView2.font = UIFont(name: "Verdana", size: 17)
        
        self.loadJsonToArys()
        
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
