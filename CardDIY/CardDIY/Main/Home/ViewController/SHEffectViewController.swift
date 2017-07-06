//
//  SHEffectViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHEffectViewController: SHBaseViewController {
    
    var hintLabel: UILabel?
    var cardImage: UIImage?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var nameTextField: UITextField?
    var effectTextField: UITextField?
    var atkTextField: UITextField?
    var defTextField: UITextField?
    var nextButton: UIButton?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField?.resignFirstResponder()
        effectTextField?.resignFirstResponder()
        atkTextField?.resignFirstResponder()
        defTextField?.resignFirstResponder()
    }
    
    func nextButtonAction(sender: UIButton) {
        let avatarVC = SHAvatarViewController()
        avatarVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(avatarVC, animated: true)
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        
        hintLabel = ({
            let label = UILabel()
            label.text = "请填写卡牌内容"
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
            return textField
        })()
        cardContentView!.addSubview(nameTextField!)
        
        effectTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: WordFontFamily, size: EffectFontSize)
            return textField
        })()
        cardContentView!.addSubview(effectTextField!)
        
        atkTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            return textField
        })()
        cardContentView!.addSubview(atkTextField!)
        
        defTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            return textField
        })()
        cardContentView!.addSubview(defTextField!)
        
        nextButton = ({
            let button = UIButton(type: .system)
            button.setTitle("下一步", for: .normal)
            button.addTarget(self, action: #selector(self.nextButtonAction(sender:)), for: .touchUpInside)
            return button;
        })()
        view.addSubview(nextButton!)
    }
    
    func makeConstraints() {
        hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo((cardContentView?.snp.top)!).offset(-hintLabelBottomMargin)
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
            make.left.top.equalTo(cardImageView!).offset(24)
            make.height.equalTo(24)
            make.right.equalTo(cardImageView!).offset(-30)
        })
        
        effectTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(cardImageView!).offset(24)
            make.height.equalTo(48)
            make.right.equalTo(cardImageView!).offset(-35)
            make.bottom.equalTo(cardImageView!).offset(-40)
        })
        
        atkTextField?.snp.makeConstraints({ (make) in
            make.right.equalTo(defTextField!).offset(-35)
            make.bottom.equalTo(cardImageView!).offset(-20)
            make.width.equalTo(20)
            make.height.equalTo(10)
        })
        
        defTextField?.snp.makeConstraints({ (make) in
            make.right.equalTo(cardImageView!).offset(-35)
            make.bottom.equalTo(cardImageView!).offset(-20)
            make.width.equalTo(20)
            make.height.equalTo(10)
        })
        
        nextButton?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(nextButtonTopMargin)
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
