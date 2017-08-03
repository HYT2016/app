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
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var chkBtns: [UIButton]!
    
    @IBOutlet weak var chkBtna: UIButton!
    @IBOutlet weak var chkBtnb: UIButton!
    
    @IBOutlet weak var chkBtnc: UIButton!
   
    @IBOutlet weak var chkBtnd: UIButton!
    
    
    @IBAction func checkBtn(_ sender: UIButton) {
        
        if userAnswer[sender.tag]{
            sender.setImage(UIImage(named: "uncheck01"), for: .normal)
            userAnswer[sender.tag]=false
        }else{
            sender.setImage(UIImage(named: "checked01"), for: .normal)
            userAnswer[sender.tag]=true
        }
       
        
    }
    
    var isWrongQuestion:Bool?=false
    var q_category:String?
    var userAnswer:[Bool]=[false,false,false,false]
    
    var wrongQFileName:[String]=[]
    var wrongQIndex:[String]=[]
    
    var doctor:[String]=[]
    var dentist:[String]=[]
    var wrongTableViewQfileNameIndex:String?
    var wrongTableViewIndex:String?
    @IBOutlet weak var testTextView2: UITextView!
 
    
    
    @IBAction func submitBtn(_ sender: UIButton) {
        

        print( "result: \(self.checkIfCorrect(qID: b))")
       
        
        if self.checkIfCorrect(qID: b ) == true {
            
            displayLabel.textColor=UIColor.black
            displayLabel.text="恭喜答對"
//            延遲0.5秒
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.displayLabel.text = ""
            }
            
            if self.q_category == wrongTableViewQfileNameIndex{
                
                q_category=wrongQFileName[QuesAnum]
                self.getQin()
                b=Int(wrongQIndex[QuesAnum])!
                
                loadQuestionToUser(qID: self.b)
                QuesAnum+=1
            }else{
                b=Int(self.randomNumber(MIN: 0, MAX: (self.questions.count-1)))
                loadQuestionToUser(qID: self.b)
                print("loadQuestionToUser:\(loadQuestionToUser(qID: self.b))")
                           }
        }else{
            if self.q_category == wrongTableViewQfileNameIndex{
            
                displayLabel.text = "再接再厲"
                displayLabel.textColor=UIColor.red
            }else if self.q_category == "牙醫國考-答錯題目"{
                displayLabel.text = "再接再厲"
                displayLabel.textColor=UIColor.red
            }else{
                displayLabel.text = "再接再厲"
                displayLabel.textColor=UIColor.red
                copyit()
            }
        }
       
        let image = UIImage(named: "uncheck01")!
        
        chkBtna.setImage(image, for: UIControlState.normal)
        chkBtnb.setImage(image, for: UIControlState.normal)
        chkBtnc.setImage(image, for: UIControlState.normal)
        chkBtnd.setImage(image, for: UIControlState.normal)
        
        for index in 0...3{
            self.userAnswer[index]=false
        }

    }
    
    
    
    
    func randomNumber(MIN: Int, MAX: Int)-> Int{
        return Int(arc4random_uniform(UInt32(MAX)) + UInt32(MIN));
        
    }
    
    
    
    var version = [String: Int]()
    
    var questions:[JSON]=[]
    
    var qTions:[JSON]=[]
    
    var indexVC=0
    
    var qID=0
    
    var b=0
    
//    var b=Int(arc4random_uniform(30))
    
    var a=0
    
    var wrongTableViewCellName:String?
    
    var preIndex:Int=0
    
    var ansStr = ""

    var wrQName = ""
    
    var bnum = 0
    
    var num = 0
    
    var qFileName:String = ""
    
    var QuesAnum = 1
    
    func loadJsonToArys(){
        print("loadJsonToArys \(String(describing: self.q_category))")
        //read file
        let filePath=Bundle.main.path(forResource: self.q_category, ofType:
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
        
        print("q num is \(questions.count)")
        

        
        b=self.getQuestionIndex()
        self.loadQuestionToUser(qID: b)
    }
    
    
    
    
    func getQuestionIndex()->Int{
        
//       if self.isWrongQuestion==false{
//        print(b)
        return Int(randomNumber(MIN: 0, MAX: (questions.count-1)))
//               }else{
////        要改
//        getQin()
//        return 1
//        }
    }
    func getWrongQuestionIndex()->Int{
        
        return Int(wrongTableViewIndex!)!
    }
        
    
    
    func  getQin(){
            // 讀檔 取得 題目 號碼 與 內容
            qFileName = wrongTableViewQfileNameIndex!
            q_category=qFileName
            print("q:\(q_category!)")
            let filePath=Bundle.main.path(forResource: self.q_category, ofType:
                "json")
            var data1:Data
            var json_parsed:JSON
            
            do{
                try data1 = Data(contentsOf: URL(fileURLWithPath:
                    filePath!, isDirectory: false))
                json_parsed=JSON(data: data1)
                questions = json_parsed.arrayValue
                                print("b=\(b)")
                
            }catch{
                print(error.localizedDescription)
                
            }
        b=self.getWrongQuestionIndex()
        self.loadQuestionToUser(qID: b)
        }
    
    
    
    
    
//    func getQuestionIndex()->Int{
//
//        if self.isWrongQuestion==false{
//            return Int(randomNumber(MIN: 0, MAX: (questions.count-1)))
//            
//        }else{
//            // 讀檔 取得 題目 號碼 與 內容
//            //            parseTxtFile()
//            
//            
//            
//            var qFileName:String = String(describing: wrongQFileName)
//            
//            
//            
//            
//            let filePath=Bundle.main.path(forResource: qFileName, ofType:
//                "json")
//            var data1:Data
//            var json_parsed:JSON
//            
//            do{
//                try data1 = Data(contentsOf: URL(fileURLWithPath:
//                    filePath!, isDirectory: false))
//                json_parsed=JSON(data: data1)
//                questions = json_parsed.arrayValue
//                
//                //            print(questions)
//                
//            }catch{
//                print(error.localizedDescription)
//            }
//            
//            return 1
//        }
//    }

    

    func checkIfCorrect(qID:Int)->Bool{
        var isCorrect=false
        
        let answer = questions[qID]["答案"].stringValue
        
        var ansStr=""
        
//        這裡聽老師解釋
        for index in 0...3{
            if self.userAnswer[index]{
                switch index {
                case 0:
                    ansStr+="A"
                case 1:
                    ansStr+="B"
                case 2:
                    ansStr+="C"
                case 3:
                    ansStr+="D"
                default:
                    break
                }
            }
        }
        print("answer = \(answer) user input ansStr =  \(ansStr)")
        if answer == ansStr{
            isCorrect=true
        }
        
        
        
        return isCorrect
    }
    
    
    func loadQuestionToUser(qID:Int){
        
        let q = questions[qID]

        let tmpStr=q["題目"].stringValue
        
        self.testTextView2.text=tmpStr
        //        print("tmpStr = \(tmpStr)")
        
    }
    func loadQuestionToUser2(qID:Int){
        
        
        
        let q = questions[qID]
        
        let tmpStr=q["題目"].stringValue
        
        self.testTextView2.text=tmpStr
        //        print("tmpStr = \(tmpStr)")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "背景 04")!)
       
        
        displayLabel.backgroundColor=UIColor(patternImage: UIImage(named: "背景 04")!)
        
        testTextView2.backgroundColor = UIColor(red: 174/255, green: 228/255, blue: 249/255, alpha: 0.5)
        testTextView2.font = UIFont.systemFont(ofSize: 20, weight: 20)
        testTextView2.textColor = UIColor(red: 41/255, green: 36/255, blue: 33/255, alpha: 1)

        testTextView2.font = UIFont.boldSystemFont(ofSize: 20)
        testTextView2.font = UIFont(name: "Verdana", size: 17)
        
        
        
        if self.q_category == doctor[1]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[2]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[3]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[4]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[5]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[6]{
            self.loadJsonToArys()
        }else if self.q_category == doctor[7]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[1]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[2]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[3]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[4]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[5]{
            self.loadJsonToArys()
        }else if self.q_category == dentist[6]{
            self.loadJsonToArys()
        }else{
            self.getQin()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    讓textView上面不留白
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        testTextView2.setContentOffset(CGPoint.zero, animated: false)
    }
    

    
//   寫檔
    func copyit() {
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        
        
        
        if self.q_category == doctor[1]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[2]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[3]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[4]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[5]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[6]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == doctor[7]{
            ansStr = "doctorAns.txt"
        }else{
            self.ansStr = "dentistAns.txt"
        }

        let fileurl =  dir.appendingPathComponent(ansStr)
        print(fileurl)
        
        let string = "\(q_category!):\(b)\n"
//        let string = "\(testTextView2.text!)\n"
        let data = string.data(using: .utf8, allowLossyConversion: false)!
        
        if FileManager.default.fileExists(atPath: fileurl.path) {
            if let fileHandle = try? FileHandle(forUpdating: fileurl) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
                
            }
        } else {
            try! data.write(to: fileurl, options: Data.WritingOptions.atomic)
        }
        
    }
    
    
    
//    func parseTxtFile()->([String],[String]){
//        
//        var tmpStr=""
//        
//        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
//        let file:URL
//        if self.q_category == "醫學國考-答錯題目"{
//            file = dir.appendingPathComponent("doctorAns.txt")
//            print(file)
//            do {
//                let text2 = try String(contentsOf: file, encoding:String.Encoding.utf8)
//                tmpStr = text2
//            }
//            catch {/* error handling here */}
//        }else if self.q_category == "牙醫國考-答錯題目"{
//            file = dir.appendingPathComponent("dentistAns.txt")
//            do {
//                let text2 = try String(contentsOf: file, encoding:String.Encoding.utf8)
//                tmpStr = text2
//            }
//            catch {/* error handling here */}
//        }
//        
//        var strArys=tmpStr.components(separatedBy: "\n")
//        strArys.removeLast()
//        for str in strArys{
//            
//            let eachStr = str.components(separatedBy: ":")
//
//            self.wrongQFileName.append(eachStr[0])
//            self.wrongQIndex.append(eachStr[1])
//            
//        }
//        return (wrongQFileName,wrongQIndex)
//        
//    }
    
   
    

    
    

    
    

}
