//
//  ViewController.swift
//  testq_category 
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var customSegmentView: CustomSegmentContol!
    @IBAction func customSegmentView(_ sender: CustomSegmentContol) {
    tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
   
    let doctor:[String]=["醫學國考-答錯題目","解剖_骨盆會陰","解剖_神解","解剖_四肢","解剖_頭頸","解剖_胸背腹","微免_免疫","微免_微生物","生化","生理","藥理"]
    let dentist:[String]=["牙醫國考-答錯題目","106-1牙醫學(ㄧ)","106-1牙醫學(二)","106-1牙醫學(三)","106-1牙醫學(四)","106-1牙醫學(五)","106-1牙醫學(六)","105-2牙醫學(一)","105-2牙醫學(二)","105-2牙醫學(三)","105-2牙醫學(四)","105-2牙醫學(五)","105-2牙醫學(六)","105-1牙醫學(ㄧ)","105-1牙醫學(二)","105-1牙醫學(三)","105-1牙醫學(四)","105-1牙醫學(五)","105-1牙醫學(六)"]
    var WrongDoctorSet=Set<String>()
    var WrongDentistSet=Set<String>()
    var wrongQFileName:[String]=[]
    var wrongQIndex:[String]=[]
    var wrongTableViewQfileNameIndex:String=""
    var wrongTableViewIndex:String=""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var str = 1
        
        switch(customSegmentView.selectedSegmentIndex)
        
        {
        case 0:
            str = doctor.count
            
            break
        case 1:
            str = dentist.count
            
            break
        default:
            
            break
        }
        return str
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.textColor = UIColor.black
//        cell字體大小
        cell.textLabel?.font = UIFont(name:"Avenir", size:22)

        switch(customSegmentView.selectedSegmentIndex)
            
        {
        case 0:
//            cell的文字
            cell.textLabel?.text = doctor[indexPath.row]
            
            break
        case 1:
            cell.textLabel?.text = dentist[indexPath.row]
            
            break
        default:
            
            break
        }

        
        return cell
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定預設按鈕
        customSegmentView.selectedSegmentIndex = 0
//        讓tableViewCell填滿tableView
        self.view.layoutIfNeeded()
//        接收方
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
        print("WrongDoctorSet:\(WrongDoctorSet)")
        
        
//        //        接收方
//        let notificationName2 = Notification.Name("updateIt")
//        NotificationCenter.default.addObserver(self, selector: #selector(updateIt(noti:)), name: notificationName2, object: nil)
//        let notificationName3 = Notification.Name("updateItQ")
//        NotificationCenter.default.addObserver(self, selector: #selector(updateItQ(noti:)), name: notificationName3, object: nil)
//        print("wrongQFileName 1:\(wrongQFileName)")
//        print("wrongQIndex 1:\(wrongQIndex)")
        
       

    }
    
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row==0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WrongVC") as! WrongVC
            vc.doctor=self.doctor
            vc.dentist=self.dentist
            vc.WrongDoctorSet=WrongDoctorSet
            vc.WrongDentistSet=WrongDentistSet
            vc.wrongQFileName=wrongQFileName
            vc.wrongQIndex=wrongQIndex
            vc.wrongTableViewQfileNameIndex=wrongTableViewQfileNameIndex
            vc.wrongTableViewIndex=wrongTableViewIndex
            if customSegmentView.selectedSegmentIndex==0{
//                這行指定
                vc.q_category = doctor[0]
                
            }else{
                vc.q_category=dentist[0]
                
            }
            
             self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameStartVC2") as! gameStartVC2
            
            if customSegmentView.selectedSegmentIndex==0{
                vc.q_category=doctor[indexPath.row]
                vc.WrongDoctorSet=WrongDoctorSet
                
            }else{
                vc.q_category=dentist[indexPath.row]
//                vc.WrongDentistSet=WrongDentistSet
            }
            
            vc.doctor=self.doctor
            vc.dentist=self.dentist
            
            if indexPath.row==0{
                vc.isWrongQuestion=true
            }else{
                vc.isWrongQuestion=false
            }
            
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor=UIColor.white

    
        }
        else
        {
            cell.backgroundColor=UIColor(red: 204/255, green: 255/255, blue: 255/255, alpha: 0.5)
        }
    }
    
    func getUpdateNoti(noti:Notification) {
        WrongDoctorSet = noti.userInfo!["PASS"] as! Set<String>
        WrongDentistSet = noti.userInfo!["PASS"] as! Set<String>
    }
   
    
//    func updateIt(noti:Notification) {
//        wrongQIndex=noti.userInfo!["PASS"] as! [String]
//        
//    }
//
//    func updateItQ(noti:Notification) {
//            wrongQFileName=noti.userInfo!["PASS"] as! [String]
//        
//        
//    }
    
    
    
    
}

