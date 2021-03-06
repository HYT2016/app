//
//  CustomSegmentContol.swift
//  test
//
//  Created by Root HSZ HSU on 2017/7/28.
//  Copyright © 2017年 Root HSZ HSU. All rights reserved.
//

import UIKit

class CustomSegmentContol: UIControl {
    var buttons=[UIButton]()
    var selector:UIView!
    var selectedSegmentIndex = 0
//    var frame: CGRect = 
    
    @IBInspectable
    var borderWidth: CGFloat = 0{
        didSet{
            layer.borderWidth=borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor=borderColor.cgColor
        }
        
    }
    @IBInspectable
    var commaSeparatedButtonTitles:String=""{
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var textColor:UIColor = .lightGray{
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var selectorColor: UIColor = .darkGray{
        didSet{
            updateView()
        }
    }
    @IBInspectable
    var selectorTextColor: UIColor = .white{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach {$0.removeFromSuperview()}
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
//        不知道怎麼做
        let selectorWidth = frame.width / (1*CGFloat(buttonTitles.count))
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        for buttonsTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(buttonsTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorColor, for: .normal)
        
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints=false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive=true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        if self.selectedSegmentIndex==0{
        self.buttons[0].setTitleColor(UIColor.init(red:  255/255, green: 221/255, blue: 0/255, alpha: 1), for: .normal)
        }

        
        
    }
    
   
    override func draw(_ rect: CGRect) {
        layer.cornerRadius=frame.height/2
//        使segment 不會超出框框外
        updateView()
        
    }
    func buttonTapped(button:UIButton){
        for (buttonIndex,btn) in buttons.enumerated(){
            btn.setTitleColor(textColor, for: .normal)
            if btn == button{
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count)*CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3,animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }

}
