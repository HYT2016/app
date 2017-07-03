//
//  gameStartVC.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit
import SwiftyJSON

class gameStartVC: UIViewController,UITextViewDelegate {
    
    
    @IBOutlet weak var TesttextView: UITextView!
    
    @IBOutlet weak var aLabel: UILabel!
  
   
    
  
    
    
    
    
//    var cateID:Int?

    var version = [String: Int]()

    var questions:[JSON]=[]
    
    var answers:[JSON]=[]
    
    var qID=0
    
    var aID=0
    
    func loadJsonToArys(){
        //read file
        let filePath=Bundle.main.path(forResource: "aaa", ofType:
            "json")
        var data1:Data
        var json_parsed:JSON
        
        
        
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            let cateStr = json_parsed["categorires"][0].stringValue
            print(cateStr)
            let datas = json_parsed[cateStr].arrayValue
            
            questions=datas
            print(questions)
          
        }catch{
            print(error.localizedDescription)
        }
        
        self.loadQuestionToUser(qID: 0)
        
    }

   
    
    
    
    func loadQuestionToUser(qID:Int){
        let q = questions[qID]
        let tmpStr=q["Question_title"].stringValue
        
        self.TesttextView.text=tmpStr
        
        
        
        
        print("tmpStr = \(tmpStr)")
    
    }
    
    
    
    
    
    
    
    
    
    func loadJsonAnswer(){
        //read file
        let filePath=Bundle.main.path(forResource: "aaa", ofType:
            "json")
        var data1:Data
        var json_parsed:JSON
        
        
        
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            let cateStr = json_parsed["categorires"][0].stringValue
            print(cateStr)
            let datas = json_parsed[cateStr].arrayValue
            
            answers=datas
            
            
        }catch{
            print(error.localizedDescription)
        }
        
        self.loadQuestionAnswer(aID: 0)
        
    }
    
    
    
    
    
    func loadQuestionAnswer(aID:Int){
        let q = answers[aID]
        let tmpStr=q["Ans_title1"].stringValue
        
        self.aLabel.text=tmpStr
        
        
        
        
        print("tmpStr = \(tmpStr)")
        
    }

    
    
    
    
    
    
    
    
    
//    
//    var version:[String] = ["",""]
//    
//    
//    func loadJsonToArys(){
//        //read file
//        let filePath=Bundle.main.path(forResource: "aaa", ofType:
//            "json")
//        var data1:Data
//        var json_parsed:JSON
//        
//        
//        
//        do{
//            try data1 = Data(contentsOf: URL(fileURLWithPath:
//                filePath!, isDirectory: false))
//            json_parsed=JSON(data: data1)
//            let aa = json_parsed["categorires"].arrayValue.map{$0.stringValue}
//            //            let aa = (json_parsed["口病"].object as AnyObject)
//            //            let aa = json_parsed["口病"].stringValue
//            print(aa)
//            self.version=aa
//            //            self.version=[aa]
//        }catch{
//            print(error.localizedDescription)
//        }
//        
//        
//        
//    }
//
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        TesttextView.text!=String(describing: version)
        
        TesttextView.backgroundColor = UIColor(red: 225/255, green: 227/255, blue: 132/255, alpha: 1)
        TesttextView.font = UIFont.systemFont(ofSize: 20, weight: 20)
        TesttextView.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)
        TesttextView.font = UIFont.boldSystemFont(ofSize: 20)
        TesttextView.font = UIFont(name: "Verdana", size: 17)
        
        
        self.loadJsonToArys()
        
        self.loadJsonAnswer()
        
//        if cateID==nil{
//            cateID=0
//        }
        
        
//        Make web links clickable
//        TesttextView.isSelectable = true
//        TesttextView.isEditable = true
//        TesttextView.dataDetectorTypes = UIDataDetectorTypes.link
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
