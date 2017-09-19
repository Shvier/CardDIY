//
//  SHYGOAttributeView.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHYGOAttributeView: SHBaseView {
    
    let buttonLength: CGFloat = 30
    let buttonCorner: CGFloat = 15
    let buttonMargin: CGFloat = 10
    
    var darkButton: UIButton?
    var lightButton: UIButton?
    var earthButton: UIButton?
    var windButton: UIButton?
    var waterButton: UIButton?
    var fireButton: UIButton?
    var godButton: UIButton?
    
    weak var delegate: SHYGOAttributeViewDelegate?
    
    @objc func buttonAction(sender: UIButton) {
        delegate?.attributeView(attributeView: self, buttonClicked: sender)
    }
    
    func initUI() {
        darkButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a0"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(darkButton!)
        
        lightButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a1"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(lightButton!)
        
        earthButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a2"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(earthButton!)
        
        windButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a3"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(windButton!)
        
        waterButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a4"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(waterButton!)
        
        fireButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a5"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(fireButton!)
        
        godButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "a6"), for: .normal)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(godButton!)
    }
    
    func makeConstraints() {
        darkButton?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.height.equalTo(buttonLength)
        })
        
        lightButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((darkButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
        })
        
        earthButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((lightButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
        })
        
        windButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((earthButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
        })
        
        waterButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((windButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
        })
        
        fireButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((waterButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
        })
        
        godButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((fireButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(darkButton!)
            make.width.equalTo(darkButton!)
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
