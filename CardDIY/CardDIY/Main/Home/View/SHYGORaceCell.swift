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

    var imageView: UIImageView?
    
    func configImage(name: String) {
        imageView?.image = UIImage(named: name)
    }
    
    func initUI() {
        imageView = ({
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            return view
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
