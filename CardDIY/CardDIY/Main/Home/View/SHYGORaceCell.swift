//
//  SHYGORaceCell.swift
//  CardDIY
//
//  Created by shvier on 08/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let SHYGORaceCellReuseIdentifier = "SHYGORaceCellReuseIdentifier"

class SHYGORaceCell: SHBaseCollectionViewCell {

    var button: UIButton?
    
    func configImage(name: String) {
        button?.setImage(UIImage(named: name), for: .normal)
    }
    
    func initUI() {
        button = ({
            let button = UIButton(type: .custom)
            return button
        })()
        addSubview(button!)
    }
    
    func makeConstraints() {
        button?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(self)
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
