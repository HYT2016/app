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
    
    
    var q_category:String?
    var userAnswer:[Bool]=[false,false,false,false]
    
    
    @IBOutlet weak var testTextView2: UITextView!
 
    
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        print( "result: \(self.checkIfCorrect(qID: b))")
       
        
        if self.checkIfCorrect(qID: b ) == true {
            
            displayLabel.textColor=UIColor.black
            displayLabel.text="恭喜答對"
//            延遲0.5秒
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                self.displayLabel.text = ""
//                self.b=Int(self.randomNumber(MIN: 0, MAX: (self.questions.count-1)))

            }
            b=Int(self.randomNumber(MIN: 0, MAX: (self.questions.count-1)))

            loadQuestionToUser(qID: self.b)
            
        }else{
            displayLabel.text = "再接再厲"
            displayLabel.textColor=UIColor.red
            
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
    
    var indexVC=0
    
    var qID=0
    
    var b=0
    
//    var b=Int(arc4random_uniform(30))
    
    var a=0

    
    var preIndex:Int=0
    
   

    
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
        
        b=Int(randomNumber(MIN: 0, MAX: (questions.count-1)))
                self.loadQuestionToUser(qID: b)
        
    }
    
//    不是很懂
    func changeUserAnswerArray(btnIndex:Int){
        self.userAnswer[btnIndex] = (self.userAnswer[btnIndex]==true) ? false : true
        
        
    }
    
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
        
        
        
        
        print("tmpStr = \(tmpStr)")
        
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
        
        self.loadJsonToArys()

        
        
        
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
    
    


    
    
}
