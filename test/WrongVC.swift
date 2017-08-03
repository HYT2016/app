//
//  WrongVC.swift
//  test
//
//  Created by ios135 on 2017/7/25.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class WrongVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var q_category:String?
    var wrongQFileName:[String]=[]
    var wrongQIndex:[String]=[]
    
    var doctor:[String]=[]
    var dentist:[String]=[]
    
    @IBOutlet weak var wrongTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrongQFileName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.black
        //        cell字體大小
        cell.textLabel?.font = UIFont(name:"Avenir", size:22)
        cell.textLabel?.text="第"+String(indexPath.row+1)+"題："+wrongQFileName[indexPath.row]+"-"+wrongQIndex[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameStartVC2") as! gameStartVC2

        vc.isWrongQuestion=true
        vc.wrongQFileName=self.wrongQFileName
        vc.wrongQIndex=self.wrongQIndex
        vc.wrongTableViewQfileNameIndex=wrongQFileName[indexPath.row]
        vc.wrongTableViewIndex=wrongQIndex[indexPath.row]
        vc.wrongTableViewCellName="第"+String(indexPath.row+1)+"題："+wrongQFileName[indexPath.row]+"-"+wrongQIndex[indexPath.row]

            vc.doctor=self.doctor
            vc.dentist=self.dentist
            
            self.navigationController?.pushViewController(vc, animated: true)
        }

//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//    {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == .delete
//        {
//            wrongQFileName.remove(at: indexPath.row)
//            wrongTableView.reloadData()
//            
//        }
//    }
    //If you want to change title
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "刪除此題"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            wrongQFileName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //        讓tableViewCell填滿tableView
        self.view.layoutIfNeeded()
        self.parseTxtFile()
        
        wrongTableView.reloadData()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func parseTxtFile(){
        
        var tmpStr=""
        
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        let file:URL
        if self.q_category == "醫學國考-答錯題目"{
            file = dir.appendingPathComponent("doctorAns.txt")
            print(file)
            do {
                let text2 = try String(contentsOf: file, encoding:String.Encoding.utf8)
                tmpStr = text2
            }
            catch {/* error handling here */}
        }else if self.q_category == "牙醫國考-答錯題目"{
            file = dir.appendingPathComponent("dentistAns.txt")
            do {
                let text2 = try String(contentsOf: file, encoding:String.Encoding.utf8)
                tmpStr = text2
            }
            catch {/* error handling here */}
        }
        
        var strArys=tmpStr.components(separatedBy: "\n")
        strArys.removeLast()
        for str in strArys{
            
            let eachStr = str.components(separatedBy: ":")
            
            self.wrongQFileName.append(eachStr[0])
            self.wrongQIndex.append(eachStr[1])
            
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
    


    
}
