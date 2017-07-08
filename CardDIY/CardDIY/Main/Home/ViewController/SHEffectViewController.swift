//
//  SHEffectViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHEffectViewController: SHBaseViewController {
    
    let nameTextFieldOffsetLeft: CGFloat = 18
    let nameTextFieldOffsetTop: CGFloat = 26
    let nameTextFieldHeight: CGFloat = 30
    let nameTextFieldOffsetRight: CGFloat = 60
    let effectTextFieldOffsetLeft: CGFloat = 26
    let effectTextFieldHeight: CGFloat = 46
    let effectTextFieldOffsetRight: CGFloat = 28
    let effectTextFieldOffsetBottom: CGFloat = 42
    let atkTextFieldOffsetRight: CGFloat = 61
    let atkTextFieldOffsetBottom: CGFloat = 25
    let atkTextFieldWidth: CGFloat = 34
    let atkTextFieldHeight: CGFloat = 12
    let defTextFieldOffsetRight = 24
    let defTextFieldOffsetBottom = 25
    
    var hintLabel: UILabel?
    var cardImage: UIImage?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var nameTextField: UITextField?
    var effectTextField: UITextField?
    var atkTextField: UITextField?
    var defTextField: UITextField?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField?.resignFirstResponder()
        effectTextField?.resignFirstResponder()
        atkTextField?.resignFirstResponder()
        defTextField?.resignFirstResponder()
    }
    
    func rightBarItemAction(sender: UIBarButtonItem) {
        let avatarVC = SHAvatarViewController()
        avatarVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(avatarVC, animated: true)
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.rightBarItemAction(sender:)))
        navigationItem.rightBarButtonItem = rightBarItem
        
        hintLabel = ({
            let label = UILabel()
            label.text = "请填写卡牌内容"
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
        
        nameTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: WordFontFamily, size: WordFontSize)
            textField.borderStyle = .roundedRect
            return textField
        })()
        cardContentView!.addSubview(nameTextField!)
        
        effectTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: WordFontFamily, size: EffectFontSize)
            textField.borderStyle = .roundedRect
            return textField
        })()
        cardContentView!.addSubview(effectTextField!)
        
        atkTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.borderStyle = .roundedRect
            return textField
        })()
        cardContentView!.addSubview(atkTextField!)
        
        defTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.borderStyle = .roundedRect
            return textField
        })()
        cardContentView!.addSubview(defTextField!)
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
        
        nameTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(cardImageView!).offset(nameTextFieldOffsetLeft)
            make.top.equalTo(cardImageView!).offset(nameTextFieldOffsetTop)
            make.height.equalTo(nameTextFieldHeight)
            make.right.equalTo(cardImageView!).offset(-nameTextFieldOffsetRight)
        })
        
        effectTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(cardImageView!).offset(effectTextFieldOffsetLeft)
            make.height.equalTo(effectTextFieldHeight)
            make.right.equalTo(cardImageView!).offset(-effectTextFieldOffsetRight)
            make.bottom.equalTo(cardImageView!).offset(-effectTextFieldOffsetBottom)
        })
        
        atkTextField?.snp.makeConstraints({ (make) in
            make.right.equalTo(defTextField!).offset(-atkTextFieldOffsetRight)
            make.bottom.equalTo(cardImageView!).offset(-atkTextFieldOffsetBottom)
            make.width.equalTo(atkTextFieldWidth)
            make.height.equalTo(atkTextFieldHeight)
        })
        
        defTextField?.snp.makeConstraints({ (make) in
            make.right.equalTo(cardImageView!).offset(-defTextFieldOffsetRight)
            make.bottom.equalTo(cardImageView!).offset(-defTextFieldOffsetBottom)
            make.width.equalTo(atkTextFieldWidth)
            make.height.equalTo(atkTextFieldHeight)
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
