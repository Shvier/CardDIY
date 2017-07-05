//
//  SHTrapTypeView.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHTrapTypeView: SHBaseView {

    let buttonMargin: CGFloat = 10
    let buttonLength: CGFloat = 24
    let buttonCorner: CGFloat = 12
    
    var antiButton: UIButton?
    var infButton: UIButton?
    
    func initUI() {
        antiButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "anti_normal"), for: .normal)
            button.setImage(UIImage(named: "anti_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(antiButton!)
        
        infButton = ({
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "inf_normal"), for: .normal)
            button.setImage(UIImage(named: "inf_selected"), for: .selected)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            return button
        })()
        addSubview(infButton!)
    }
    
    func makeConstraints() {
        antiButton?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.height.equalTo(buttonLength)
        })
        
        infButton?.snp.makeConstraints({ (make) in
            make.left.equalTo((antiButton?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(antiButton!)
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
