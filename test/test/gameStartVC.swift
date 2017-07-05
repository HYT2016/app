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
    
    var q_category:String?
    
    @IBOutlet weak var TesttextView: UITextView!
    
    @IBOutlet weak var aLabel: UILabel!
  
   
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var cLabel: UILabel!
  
    @IBOutlet weak var dLabel: UILabel!
    
    
    @IBOutlet weak var checkBtna: UIButton!
    
    @IBOutlet weak var checkBtnb: UIButton!
    
    @IBOutlet weak var checkBtnc: UIButton!
    
    @IBOutlet weak var checkBtnd: UIButton!
    
    @IBAction func pressBtn(_ sender: UIButton) {
//        toggle(button: sender, onImage: <#T##UIImage#>, offimage: <#T##UIImage#>)
        
        
        
    }
    
    
    // arc4num 
    
    
    
    
    @IBAction func submit(_ sender: UIButton) {
        
//        for i in 1...2 {
//            a = a + i
//        }
        for i in 1...2 {
            b = b + i
        }
        
        self.loadJsonToArys()
        self.loadJsonAnswer()
        
        
        
    }
   
    
    
    
//    var cateID:Int?

    var version = [String: Int]()

    var questions:[JSON]=[]
    
    var indexVC=0
    
    var qID=0
    
    var a=0
    
    var b=0
    
     var preIndex:Int=0
    
    func loadJsonToArys(){
        //read file
        let filePath=Bundle.main.path(forResource: self.q_category, ofType:
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
        
        self.loadQuestionToUser(qID: b)
//        self.loadQuestionToUser(qID: 0)
        
    }

   
    
    
    
    func loadQuestionToUser(qID:Int){
//    func loadQuestionToUser(qID:Int){
//        let q = questions[qID]
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
            
            
            let cateStr = json_parsed["categorires"][a].stringValue
            print(cateStr)
            let datas = json_parsed[cateStr].arrayValue
            
            questions=datas
            
            
        }catch{
            print(error.localizedDescription)
        }
        
        self.loadQuestionAnswer(qID: b)
        
    }
    
    
    
    
    
    func loadQuestionAnswer(qID:Int){
        let q = questions[qID]
        let tmpStra=q["Ans_title1"].stringValue
        let tmpStrb=q["Ans_title2"].stringValue
        let tmpStrc=q["Ans_title3"].stringValue
        let tmpStrd=q["Ans_title4"].stringValue
        self.aLabel.text=tmpStra
        self.bLabel.text=tmpStrb
        self.cLabel.text=tmpStrc
        self.dLabel.text=tmpStrd
        
        print("tmpStr = \(tmpStra)")
        
    }

    func updata(){
        
    
    
    
    
    
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
        
        print(self.q_category)
    
        TesttextView.text!=String(describing: version)
        
        TesttextView.backgroundColor = UIColor(red: 225/255, green: 227/255, blue: 132/255, alpha: 1)
        TesttextView.font = UIFont.systemFont(ofSize: 20, weight: 20)
        TesttextView.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)
        TesttextView.font = UIFont.boldSystemFont(ofSize: 20)
        TesttextView.font = UIFont(name: "Verdana", size: 17)
        
        
        self.loadJsonToArys()
        
        self.loadJsonAnswer()
        
    
        func viewWillAppear(_ animate:Bool){
        
        
        
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
