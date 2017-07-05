//
//  SHEffectViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHEffectViewController: SHBaseViewController {
    
    var cardImage: UIImage?
    var cardImageView: UIImageView?
    var nameTextField: UITextField?
    var effectTextField: UITextField?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField?.resignFirstResponder()
        effectTextField?.resignFirstResponder()
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        
        cardImageView = ({
            let imageView = UIImageView()
            imageView.image = cardImage
            return imageView
        })()
        view.addSubview(cardImageView!)
        
        nameTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: WordFontFamily, size: WordFontSize)
            return textField
        })()
        view.addSubview(nameTextField!)
        
        effectTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: WordFontFamily, size: WordFontSize)
            return textField
        })()
        view.addSubview(effectTextField!)
    }
    
    func makeConstraints() {
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        nameTextField?.snp.makeConstraints({ (make) in
            make.left.top.equalTo(cardImageView!).offset(24)
            make.height.equalTo(24)
            make.right.equalTo(cardImageView!).offset(-30)
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
