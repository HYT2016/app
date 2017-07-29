//
//  TableviewCellTableViewCell.swift
//  test
//
//  Created by Root HSZ HSU on 2017/7/29.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    
    var locationLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureView()
    }
    
    func configureView() {
        
        print("cell width is \(self.frame.size.width)")
        print("cell bounds is \(self.contentView.frame.width)")
        locationLabel.text = "custom cell"
        locationLabel.textColor = UIColor.white
        locationLabel.backgroundColor = UIColor.black
        
        self.addSubview(locationLabel)
        // add and configure subviews here
    }
    
}
