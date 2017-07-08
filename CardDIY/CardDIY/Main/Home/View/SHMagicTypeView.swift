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
    let buttonLength: CGFloat = 30
    let buttonCorner: CGFloat = 15

    lazy var buttons: [UIButton] = {
        return Array<UIButton>()
    }()
    
    var infButton: UIButton?
    var thunderButton: UIButton?
    var crossButton: UIButton?
    var compassButton: UIButton?
    var fireButton: UIButton?
    
    weak var delegate: SHYGOMagicTypeViewDelegate?
    
    func unselectButton(exclude: UIButton) {
        for button in buttons {
            if button.isEqual(exclude) {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    func buttonAction(sender: UIButton) {
        delegate?.magicTypeView(magicTypeView: self, buttonClicked: sender)
    }
    
    func initUI() {
        infButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "inf_normal"), for: .normal)
            button.setImage(UIImage(named: "inf_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(infButton!)
        buttons.append(infButton!)
        
        thunderButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "thunder_normal"), for: .normal)
            button.setImage(UIImage(named: "thunder_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(thunderButton!)
        buttons.append(thunderButton!)
        
        crossButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "cross_normal"), for: .normal)
            button.setImage(UIImage(named: "cross_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(crossButton!)
        buttons.append(crossButton!)
        
        compassButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "compass_normal"), for: .normal)
            button.setImage(UIImage(named: "compass_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(compassButton!)
        buttons.append(compassButton!)
        
        fireButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "fire_normal"), for: .normal)
            button.setImage(UIImage(named: "fire_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(fireButton!)
        buttons.append(fireButton!)
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
 
