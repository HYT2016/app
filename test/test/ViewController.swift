//
//  ViewController.swift
//  test
//
//  Created by Root HSZ HSU on 2017/6/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
   
    let doctor:[String]=["醫學國考-答錯題目","解剖_骨盆會陰","解剖_神解","解剖_四肢","解剖_頭頸","解剖_胸背腹","微免_免疫","微免_微生物"]
    let dentist:[String]=["牙醫國考-答錯題目","106-1牙醫學(ㄧ)","106-1牙醫學(二)","106-1牙醫學(三)","106-1牙醫學(四)","106-1牙醫學(五)","106-1牙醫學(六)"]
 
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var str = 1
        
        switch(segment.selectedSegmentIndex)
        
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
        
        switch(segment.selectedSegmentIndex)
            
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
        segment.selectedSegmentIndex = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func segmentChange(_ sender: Any) {
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameStartVC2") as! gameStartVC2
        
        
        
//       指到第零個cell讀檔加寫檔
        
        if segment.selectedSegmentIndex==0{
            vc.q_category=doctor[indexPath.row]
        }else{
            vc.q_category=dentist[indexPath.row]
        }
        
        if indexPath.row==0{
            vc.isWrongQuestion=true
        }else{
            vc.isWrongQuestion=false
        }
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        

        
        
        
        
        

        
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab_bar_1") as! tab_bar_1
//            let subVC = vc.viewControllers?[0] as! gameStartVC2
//            
//            subVC.q_category=doctor[indexPath.row]
//        
//            self.navigationController?.pushViewController(vc, animated: true)
//        
        
        
        
    }
    
    
//    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        
//        print("indexPath.row = DeselectRow第\(indexPath.row)行")
//        
//    }
//    
        
    
    
    
    
    
    
    
    
    
    

    
}

