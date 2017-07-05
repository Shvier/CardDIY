//
//  SHMagicTypeView.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHMagicTypeView: SHBaseView {
    
    let buttonMargin: CGFloat = 10
    let buttonLength: CGFloat = 24
    let buttonCorner: CGFloat = 12

    var infButton: UIButton?
    var thunderButton: UIButton?
    var crossButton: UIButton?
    var compassButton: UIButton?
    var fireButton: UIButton?
    
    func initUI() {
        infButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "inf"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(infButton!)
        
        thunderButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "thunder"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(thunderButton!)
        
        crossButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "cross"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(crossButton!)
        
        compassButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "compass"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(compassButton!)
        
        fireButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "fire"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(fireButton!)
    }
    
    func makeConstraints() {
        infButton?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.height.equalTo(buttonLength)
        })
        
        thunderButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((infButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(infButton!)
            make.width.equalTo(buttonLength)
        })
        
        crossButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((thunderButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(infButton!)
            make.width.equalTo(buttonLength)
        })
        
        compassButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((crossButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(infButton!)
            make.width.equalTo(buttonLength)
        })
        
        fireButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((compassButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(infButton!)
            make.width.equalTo(buttonLength)
            make.right.equalTo(self)
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
 
