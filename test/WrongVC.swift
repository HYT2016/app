//
//  WrongVC.swift
//  test
//
//  Created by ios135 on 2017/7/25.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class WrongVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var wrongTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
