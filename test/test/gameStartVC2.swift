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
    var indexPath_row=1
    var indexPath_max=1
    var WrongDoctorSet=Set<String>()
    var WrongDentistSet=Set<String>()
    var isWrongQuestion:Bool?=false
    var q_category:String?
    var q_category1:String?
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
//            僅改變字體大小
            self.displayLabel.font = self.displayLabel.font.withSize(22)
            displayLabel.text="恭喜答對"
//            延遲0.5秒
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.displayLabel.text = ""
            }

            if self.q_category == wrongTableViewQfileNameIndex{
                if indexPath_row==indexPath_max{
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.displayLabel.text = "恭喜完成所有錯誤題目"
//                        字體放大且字體變粗
                        self.displayLabel.font = UIFont.boldSystemFont(ofSize: 30)
                        self.displayLabel.textColor=UIColor(red: 128/255, green: 42/255, blue: 42/255, alpha: 1)
                        
                    }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
//                            使頁面跳回上一頁
                            self.navigationController?.popViewController(animated: true)
                            
                            
                    }

//                    indexPath_row=0
//                    q_category1 = wrongQFileName[indexPath_row]
//                    self.getQin2()
                }else{
//                 wrongQFileName[indexPath_row]代表可以正常跳到下一題不用從頭開始
                    q_category1 = wrongQFileName[indexPath_row]
                    self.getQin2()

                    indexPath_row+=1
                }
            }else{
                b=Int(self.randomNumber(MIN: 0, MAX: (self.questions.count-1)))
                loadQuestionToUser(qID: self.b)
                print("loadQuestionToUser:\(loadQuestionToUser(qID: self.b))")
                           }
        }else{
            if self.q_category == wrongTableViewQfileNameIndex{
                self.displayLabel.font = self.displayLabel.font.withSize(22)
                displayLabel.text = "再接再厲"
                displayLabel.textColor=UIColor.red
            }else{
                self.displayLabel.font = self.displayLabel.font.withSize(22)
                displayLabel.text = "再接再厲"
                displayLabel.textColor=UIColor.red
                copyit()
                copyit2()
//                發送方
                let notificationName = Notification.Name("GetUpdateNoti")
                NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":WrongDoctorSet])
//                NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":WrongDentistSet])
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
    
    var QuesAnum=1
    
    
    
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
                
                
            }catch{
                print(error.localizedDescription)
                
            }
        b=self.getWrongQuestionIndex()
        self.loadQuestionToUser(qID: b)
        print("b=\(b)")
        }
    func  getQin2(){
        // 讀檔 取得 題目 號碼 與 內容
        
        
        let filePath=Bundle.main.path(forResource: self.q_category1, ofType:
            "json")
        var data1:Data
        var json_parsed:JSON
        
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
            json_parsed=JSON(data: data1)
            questions = json_parsed.arrayValue
            
            
        }catch{
            print(error.localizedDescription)
            
        }
        b=Int(wrongQIndex[indexPath_row])!
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
        
//        for i in 1...7{
//            
//            if self.q_category == doctor[i]{
//                ansStr="doctorAns.txt"
//            }else{
//                ansStr="dentistAns.txt"
//            }
//        }
//        
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
        let string2 = "\(q_category!):\(b)"
//        let string = "\(testTextView2.text!)\n"
        let data = string.data(using: .utf8, allowLossyConversion: false)!
        
        if FileManager.default.fileExists(atPath: fileurl.path) {
            if let fileHandle = try? FileHandle(forUpdating: fileurl) {
//                讓資料不會重複存取
                if WrongDoctorSet .contains(string2){
                    print("已經有資料")
                }else if WrongDoctorSet .contains(string2){
                    print("已經有資料")
                }else{
                    fileHandle.seekToEndOfFile()
                    fileHandle.write(data)
                    fileHandle.closeFile()
                    
                }
               
            }
        } else {
            try! data.write(to: fileurl, options: Data.WritingOptions.atomic)
        }
        
    }
    
    func copyit2() {
        
        let string1 = "\(q_category!):\(b)"
        
        if self.q_category == doctor[1]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[2]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[3]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[4]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[5]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[6]{
            WrongDoctorSet.insert(string1)
        }else if self.q_category == doctor[7]{
            WrongDoctorSet.insert(string1)
        }else{
            WrongDentistSet.insert(string1)
        }
        print("WrongDoctorSet:\(WrongDoctorSet)")
        print("WrongDentistSet:\(WrongDentistSet)")
    }

    
       
    

    
    

    
    

}
