//
//  SHAvatarViewController.swift
//  CardDIY
//
//  Created by shvier on 05/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHAvatarViewController: SHBaseViewController {
    
    var hintLabel: UILabel?
    var cardImage: UIImage?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var avatarImageView: UIImageView?
    
    func tapAction(tap: UITapGestureRecognizer) {
        
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        hintLabel = ({
            let label = UILabel()
            label.text = "请挑选卡牌图片"
            label.font = UIFont(name: WordFontFamily, size: hintLabelFontSize)
            return label
        })()
        view.addSubview(hintLabel!)
        
        cardContentView = ({
            let view = UIView()
            return view
        })()
        view.addSubview(cardContentView!)
        
        cardImageView = ({
            let imageView = UIImageView()
            imageView.image = cardImage
            return imageView
        })()
        cardContentView!.addSubview(cardImageView!)
        
        avatarImageView = ({
            let imageView = UIImageView()
            imageView.isUserInteractionEnabled = true
            imageView.backgroundColor = UIColor.orange
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(tap:)))
            imageView.addGestureRecognizer(tap)
            return imageView
        })()
        cardContentView!.addSubview(avatarImageView!)
    }
    
    func makeConstraints() {
        hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(cardContentView!.snp.top).offset(-hintLabelBottomMargin)
        })
        
        cardContentView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(cardContentView!)
        })
        
        avatarImageView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardContentView!)
            make.centerY.equalTo(cardContentView!).offset(-20)
            make.width.equalTo(210)
            make.height.equalTo(220)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        makeConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
