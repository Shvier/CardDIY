//
//  SHEffectViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHEffectViewController: SHBaseViewController {
    
    let nameTextFieldOffsetLeft: CGFloat = 26
    let nameTextFieldOffsetTop: CGFloat = 26
    let nameTextFieldHeight: CGFloat = 30
    let nameTextFieldOffsetRight: CGFloat = 60
    let raceLabelOffsetLeft: CGFloat = 2
    let raceLabelOffsetBottom: CGFloat = 8
    let effectTextFieldOffsetLeft: CGFloat = 22
    let effectTextFieldHeight: CGFloat = 57
    let effectTextFieldOffsetRight: CGFloat = 28
    let effectTextFieldOffsetBottom: CGFloat = 39
    let atkTextFieldOffsetRight: CGFloat = 61
    let atkTextFieldOffsetBottom: CGFloat = 25
    let atkTextFieldWidth: CGFloat = 34
    let atkTextFieldHeight: CGFloat = 12
    let defTextFieldOffsetRight: CGFloat = 24
    let defTextFieldOffsetBottom: CGFloat = 25
    let raceViewHeight: CGFloat = 70
    
    lazy var raceStrings: [String] = {
        return ["水族", "兽族", "兽战士族", "创造神族", "Cyverse", "恐龙族", "幻神兽族", "龙族", "天使族", "恶魔族", "鱼族", "昆虫族", "机械组", "植物组", "念动力族", "炎族", "爬虫族", "岩石族", "海龙族", "魔法师族", "雷族", "战士族", "鸟兽族", "幻龙族", "不死族"]
    }()
    
    var hintLabel: UILabel?
    var cardImage: UIImage?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var nameTextField: SHTextField?
    var raceLabel: UILabel?
    var effectTextField: UITextView?
    var atkTextField: UITextField?
    var defTextField: UITextField?
    var raceView: SHYGORaceView?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField?.resignFirstResponder()
        effectTextField?.resignFirstResponder()
        atkTextField?.resignFirstResponder()
        defTextField?.resignFirstResponder()
    }
    
    func rightBarItemAction(sender: UIBarButtonItem) {
        if nameTextField?.text == "" {
            nameTextField?.isHidden = true
        }
        if atkTextField?.text == "" {
            atkTextField?.isHidden = true
        }
        if defTextField?.text == "" {
            defTextField?.isHidden = true
        }
        let avatarVC = SHAvatarViewController()
        avatarVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(avatarVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.sharedInstance.isMonster() {
            atkTextField?.isHidden = false
            defTextField?.isHidden = false
        }
        nameTextField?.isHidden = false
    }
    
    func configType() {
        if !SHYGOConfiguration.sharedInstance.isMonster() {
            hideMonster()
        }
    }
    
    func hideMonster() {
        atkTextField?.isHidden = true
        defTextField?.isHidden = true
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
            let textField = SHTextField()
            textField.font = UIFont(name: WordFontFamily, size: WordFontSize)
            textField.placeholder = "点击编辑"
            return textField
        })()
        cardContentView!.addSubview(nameTextField!)
        
        raceLabel = ({
            let label = UILabel()
            label.font = UIFont(name: WordFontFamily, size: 12)
            label.textAlignment = .left
            return label
        })()
        cardContentView!.addSubview(raceLabel!)
        
        effectTextField = ({
            let textView = UITextView()
            textView.font = UIFont(name: WordFontFamily, size: EffectFontSize)
            textView.textAlignment = .left
            textView.backgroundColor = UIColor.clear
            return textView
        })()
        cardContentView!.addSubview(effectTextField!)
        
        atkTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.placeholder = "编辑"
            return textField
        })()
        cardContentView!.addSubview(atkTextField!)
        
        defTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.placeholder = "编辑"
            return textField
        })()
        cardContentView!.addSubview(defTextField!)
        
        raceView = ({
            let view = SHYGORaceView()
            view.delegate = self
            return view
        })()
        view.addSubview(raceView!)
        
        configType()
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
        
        raceLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(effectTextField!).offset(-raceLabelOffsetLeft)
            make.bottom.equalTo(effectTextField!.snp.top).offset(raceLabelOffsetBottom)
        })
        
        effectTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(cardImageView!).offset(effectTextFieldOffsetLeft+1)
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
        
        raceView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
            make.width.equalTo(cardImageView!)
            make.height.equalTo(raceViewHeight)
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

extension SHEffectViewController: SHYGORaceViewDelegate {
    
    func raceView(didClicked cell: SHYGORaceCell, atIndexPath indexPath: IndexPath) {
        var race = "【" + raceStrings[indexPath.row]
        if SHYGOConfiguration.sharedInstance.hasEffect {
            switch SHYGOConfiguration.sharedInstance.type! {
            case "b0":
                race += "】"
                break
            case "b1":
                race += "·效果】"
            case "b2":
                race += "/仪式/效果】"
                break
            case "b3":
                race += "/融合/效果】"
                break
            case "b4":
                race += "·同调/效果】"
                break
            case "b5":
                race += "·超量/效果】"
                break
            default:
                break
            }
        } else {
            switch SHYGOConfiguration.sharedInstance.type! {
            case "b0":
                race += "】"
                break
            case "b1":
                race += "·效果】"
            case "b2":
                race += "/仪式】"
                break
            case "b3":
                race += "/融合】"
                break
            case "b4":
                race += "·同调】"
                break
            case "b5":
                race += "·超量】"
                break
            default:
                break
            }
        }
        raceLabel?.text = race
    }
    
}
