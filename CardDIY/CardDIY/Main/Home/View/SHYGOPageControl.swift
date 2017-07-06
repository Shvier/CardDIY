//
//  SHYGOPageControl.swift
//  CardDIY
//
//  Created by shvier on 06/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHYGOPageControl: SHBaseView {
    
    let buttonLength: CGFloat = 12
    let buttonMargin: CGFloat = 6
    
    weak var delegate: SHYGOPageControlDelegate?

    lazy var buttons: [UIButton] = {
        return Array<UIButton>()
    }()
    
    var button1: UIButton?
    var button2: UIButton?
    var button3: UIButton?
    var button4: UIButton?
    var button5: UIButton?
    var button6: UIButton?
    var button7: UIButton?
    var button8: UIButton?
    
    func unselected(exclude sender: UIButton) {
        for button in buttons {
            if button.isEqual(sender) {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    func buttonAction(sender: UIButton) {
        delegate?.pageControl(pageControl: self, buttonClicked: sender)
    }
    
    func initUI() {
        button1 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator0"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button1!)
        buttons.append(button1!)
        
        button2 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator1"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button2!)
        buttons.append(button2!)
        
        button3 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator2"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button3!)
        buttons.append(button3!)
        
        button4 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator3"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button4!)
        buttons.append(button4!)
        
        button5 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator4"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button5!)
        buttons.append(button5!)
        
        button6 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator5"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button6!)
        buttons.append(button6!)
        
        button7 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator6"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button7!)
        buttons.append(button7!)
        
        button8 = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "indicator7"), for: .normal)
            button.setImage(UIImage(named: "indicator"), for: .selected)
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(button8!)
        buttons.append(button8!)
    }
    
    func makeConstraints() {
        button1?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.height.equalTo(buttonLength)
        })
        
        button2?.snp.makeConstraints({ (make) in
            make.left.equalTo(button1!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button3?.snp.makeConstraints({ (make) in
            make.left.equalTo(button2!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button4?.snp.makeConstraints({ (make) in
            make.left.equalTo(button3!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button5?.snp.makeConstraints({ (make) in
            make.left.equalTo(button4!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button6?.snp.makeConstraints({ (make) in
            make.left.equalTo(button5!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button7?.snp.makeConstraints({ (make) in
            make.left.equalTo(button6!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
            make.width.equalTo(buttonLength)
        })
        
        button8?.snp.makeConstraints({ (make) in
            make.left.equalTo(button7!.snp.right).offset(buttonMargin)
            make.top.bottom.equalTo(button1!)
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
