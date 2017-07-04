//
//  SHYGOCardCell.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let SHYGOCardCellReuseIdentifier: String = "SHYGOCardCellReuseIdentifier"

class SHYGOCardCell: SHBaseCollectionViewCell {

    var imageView: UIImageView?
    
    func initUI() {
        imageView = ({
            let imageView = UIImageView()
            return imageView
        })()
        addSubview(imageView!)
    }
    
    func makeConstraints() {
        imageView?.snp.makeConstraints({ (make) in
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
