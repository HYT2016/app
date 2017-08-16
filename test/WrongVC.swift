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
    var wrongTableViewQfileNameIndex:String=""
    var wrongTableViewIndex:String=""
    var doctor:[String]=[]
    var dentist:[String]=[]
    var WrongDoctorSet=Set<String>()
    var WrongDentistSet=Set<String>()
    var wrongQfile:String=""
    var QuesAnum=1
    var ansStr = ""
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
        QuesAnum=Int(wrongQIndex[indexPath.row])!
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameStartVC2") as! gameStartVC2
        vc.isWrongQuestion=true
        vc.wrongQFileName=self.wrongQFileName
        vc.wrongQIndex=self.wrongQIndex
//        vc.wrongTableViewQfileNameIndex=wrongQFileName[indexPath.row]
        wrongTableViewQfileNameIndex=wrongQFileName[indexPath.row]
        vc.wrongTableViewQfileNameIndex=wrongTableViewQfileNameIndex
//        vc.wrongTableViewIndex=wrongQIndex[indexPath.row]
        wrongTableViewIndex=wrongQIndex[indexPath.row]
        vc.wrongTableViewIndex=wrongTableViewIndex
        vc.wrongTableViewCellName="第"+String(indexPath.row+1)+"題："+wrongQFileName[indexPath.row]+"-"+wrongQIndex[indexPath.row]
        vc.indexPath_row=indexPath.row+1
        vc.indexPath_max=wrongQFileName.count

            vc.doctor=self.doctor
            vc.dentist=self.dentist
        
        
            
            self.navigationController?.pushViewController(vc, animated: true)
        }

    //If you want to change title
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
//        做刪除動作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            print("wrongQFileName 1:\(wrongQFileName)")
            print("wrongQIndex 1:\(wrongQIndex)")
//            print("wrongTableViewQfileNameIndex 1:\(wrongTableViewQfileNameIndex)")
//            WrongDoctorSet.remove("\(wrongQFileName[indexPath.row]):\(wrongQIndex[indexPath.row])\n")
//            print("WrongDoctorSet:\(wrongQFileName)")
            wrongQFileName.remove(at: indexPath.row)
            wrongQIndex.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            

        
            
            
            
            
            print("wrongQFileName 2:\(wrongQFileName)")
            print("wrongQIndex 2:\(wrongQIndex)")

//            //                發送方
//            let notificationName3 = Notification.Name("updateItQ")
//            NotificationCenter.default.post(name: notificationName3, object: nil, userInfo: ["PASS": wrongQFileName])
//            let notificationName2 = Notification.Name("updateIt")
//            NotificationCenter.default.post(name: notificationName2, object: nil, userInfo: ["PASS":wrongQIndex])

            removeData()
            copyit()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        讓tableViewCell填滿tableView
        self.view.layoutIfNeeded()
        self.parseTxtFile()
        
//        print("wrongQFileName.count:\(wrongQFileName.count)")
//        print("wrongQFileName:\(wrongQFileName)")
        
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
            wrongQfile=str
            let eachStr = str.components(separatedBy: ":")
            
            self.wrongQFileName.append(eachStr[0])
            self.wrongQIndex.append(eachStr[1])
            
        }
        
        
    }
//    刪除"整個"txt檔
    func removeData(){
        // Fine documents directory on device
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        if self.q_category == doctor[0]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == dentist[0]{
            ansStr = "dentistANS.txt"
        }
        let fileurl =  dir.appendingPathComponent(ansStr)
        print("remove:\(fileurl)")
        
        
        do {
            let fileManager = FileManager.default
            
            // Check if file exists
            if fileManager.fileExists(atPath: fileurl.path) {
                // Delete file
                
                try fileManager.removeItem(atPath: fileurl.path)
                
                
            } else {
                print("File does not exist")
                
            }
            
        }
        catch let error as NSError {
            print("An error took place: \(error)")
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
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.wrongTableView.reloadData()
    }
//    檔案被刪除後重建
    func copyit() {
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        if self.q_category == doctor[0]{
            ansStr = "doctorAns.txt"
        }else if self.q_category == dentist[0]{
            ansStr = "dentistAns.txt"
        }
        let fileurl =  dir.appendingPathComponent(ansStr)
        print(fileurl)
        for i in 0...wrongQFileName.count-1 {
        
        let string = "\(wrongQFileName[i]):\(wrongQIndex[i])\n"
        
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
    }



    
}
