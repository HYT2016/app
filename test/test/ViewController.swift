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
   
    let doctor:[String]=["解剖_骨盆會陰","解剖_神解","解剖_四肢","解剖_頭頸","解剖_胸背腹","微免_免疫","微免_微生物"]
    let dentist:[String]=["口解","牙型","口胚","生化"]
 
  
    
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
        
        
        if segment.selectedSegmentIndex==0{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab_bar_1") as! tab_bar_1
            let subVC = vc.viewControllers?[0] as! gameStartVC2
            
            subVC.q_category=doctor[indexPath.row]
            
//            vc.q_category=dentist[indexPath.row]
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        
        
        }else{
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab_bar_2") as! tab_bar_2
        

//        vc.q_category=dentist[indexPath.row]
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

    
}

