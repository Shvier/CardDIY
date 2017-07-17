//
//  SHEffectViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHEffectViewController: SHBaseViewController {
    
    let nameTextFieldOffsetLeftForiPhone6P: CGFloat = 26
    let nameTextFieldOffsetTopForiPhone6P: CGFloat = 26
    let nameTextFieldHeight: CGFloat = 30
    let nameTextFieldOffsetRightForiPhone6P: CGFloat = 60
    let raceLabelOffsetLeftForiPhone6P: CGFloat = 0.5
    let effectTextFieldOffsetTopForiPhone6P: CGFloat = 3
    let effectTextFieldOffsetLeftForiPhone6P: CGFloat = 2
    let effectViewOffsetLeftForiPhone6P: CGFloat = 22
    let effectViewHeightForiPhone6P: CGFloat = 59
    let effectViewOffsetRightForiPhone6P: CGFloat = 28
    let effectViewOffsetBottomForiPhone6P: CGFloat = 39
    let atkTextFieldOffsetRightForiPhone6P: CGFloat = 61
    let atkTextFieldOffsetBottomForiPhone6P: CGFloat = 25
    let atkTextFieldWidth: CGFloat = 34
    let atkTextFieldHeight: CGFloat = 12
    let defTextFieldOffsetRightForiPhone6P: CGFloat = 24
    let defTextFieldOffsetBottomForiPhone6P: CGFloat = 25
    let raceViewHeightForiPhone6P: CGFloat = 70
    
    let nameTextFieldOffsetLeftForiPhone6: CGFloat = 26*offsetRatio + 2
    let nameTextFieldOffsetTopForiPhone6: CGFloat = 26*offsetRatio - 2
    let nameTextFieldOffsetRightForiPhone6: CGFloat = 60*offsetRatio
    let raceLabelOffsetLeftForiPhone6: CGFloat = 6
    let effectTextFieldOffsetTopForiPhone6: CGFloat = 5
    let effectTextFieldOffsetLeftForiPhone6: CGFloat = 4
    let effectViewOffsetLeftForiPhone6: CGFloat = 22*offsetRatio + 5
    let effectViewHeightForiPhone6: CGFloat = 57*offsetRatio + 2
    let effectViewOffsetRightForiPhone6: CGFloat = 28*offsetRatio
    let effectViewOffsetBottomForiPhone6: CGFloat = 39*offsetRatio
    let atkTextFieldOffsetRightForiPhone6: CGFloat = 61*offsetRatio - 1
    let atkTextFieldOffsetBottomForiPhone6: CGFloat = 25*offsetRatio - 1
    let defTextFieldOffsetRightForiPhone6: CGFloat = 24*offsetRatio - 5
    let defTextFieldOffsetBottomForiPhone6: CGFloat = 25*offsetRatio - 1
    let raceViewHeightForiPhone6: CGFloat = 70*offsetRatio

    let nameTextFieldOffsetLeftForiPhone5: CGFloat = 26*offsetRatio - 2
    let nameTextFieldOffsetTopForiPhone5: CGFloat = 26*offsetRatio - 4
    let nameTextFieldOffsetRightForiPhone5: CGFloat = 60*offsetRatio
    let raceLabelOffsetLeftForiPhone5: CGFloat = 6
    let effectTextFieldOffsetTopForiPhone5: CGFloat = 5
    let effectTextFieldOffsetLeftForiPhone5: CGFloat = 4
    let effectViewOffsetLeftForiPhone5: CGFloat = 22*offsetRatio + 3
    let effectViewHeightForiPhone5: CGFloat = 57*offsetRatio - 2
    let effectViewOffsetRightForiPhone5: CGFloat = 28*offsetRatio
    let effectViewOffsetBottomForiPhone5: CGFloat = 39*offsetRatio
    let atkTextFieldOffsetRightForiPhone5: CGFloat = 61*offsetRatio - 3
    let atkTextFieldOffsetBottomForiPhone5: CGFloat = 25*offsetRatio - 3
    let defTextFieldOffsetRightForiPhone5: CGFloat = 24*offsetRatio - 12
    let defTextFieldOffsetBottomForiPhone5: CGFloat = 25*offsetRatio - 3
    let raceViewHeightForiPhone5: CGFloat = 70*offsetRatio
    
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
    var effectView: UIView?
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
        if SHYGOConfiguration.shared.isMonster() {
            atkTextField?.isHidden = false
            defTextField?.isHidden = false
        }
        nameTextField?.isHidden = false
    }
    
    func configType() {
        if !SHYGOConfiguration.shared.isMonster() {
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
        
        effectView = ({
            let view = UIView()
            return view
        })()
        cardContentView!.addSubview(effectView!)
        
        raceLabel = ({
            let label = UILabel()
            label.font = UIFont(name: WordFontFamily, size: 12*offsetRatio)
            label.textAlignment = .left
            return label
        })()
        effectView!.addSubview(raceLabel!)
        
        effectTextField = ({
            let textView = UITextView()
            textView.font = UIFont(name: WordFontFamily, size: EffectFontSize)
            textView.textAlignment = .left
            textView.backgroundColor = UIColor.clear
            return textView
        })()
        effectView!.addSubview(effectTextField!)
        
        atkTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.placeholder = "编辑"
            textField.delegate = self
            return textField
        })()
        cardContentView!.addSubview(atkTextField!)
        
        defTextField = ({
            let textField = UITextField()
            textField.font = UIFont(name: NumberFontFamily, size: NumberFontSize)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.placeholder = "编辑"
            textField.delegate = self
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
        self.hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.cardContentView!.snp.top).offset(-hintLabelBottomMargin)
        })
        
        self.cardContentView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(cardMadeViewMargin)
            make.right.equalTo(self.view).offset(-cardMadeViewMargin)
            make.bottom.equalTo(self.view).offset(-cardMadeViewBottomMargin)
            make.height.equalTo((self.cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        self.cardImageView?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(self.cardContentView!)
        })
        switch ScreenHeight {
        case iPhone4Height:
            break
        case iPhone5Height:
            self.nameTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetLeftForiPhone5)
                make.top.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetTopForiPhone5)
                make.height.equalTo(self.nameTextFieldHeight)
                make.right.equalTo(self.cardImageView!).offset(-self.nameTextFieldOffsetRightForiPhone5)
            })
            
            self.effectView?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.effectViewOffsetLeftForiPhone5)
                make.height.equalTo(self.effectViewHeightForiPhone5)
                make.right.equalTo(self.cardImageView!).offset(-self.effectViewOffsetRightForiPhone5)
                make.bottom.equalTo(self.cardImageView!).offset(-self.effectViewOffsetBottomForiPhone5)
            })
            
            self.raceLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(-self.raceLabelOffsetLeftForiPhone5)
                make.top.right.equalTo(self.effectView!)
            })
            
            self.effectTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(-self.effectTextFieldOffsetLeftForiPhone5)
                make.right.bottom.equalTo(self.effectView!)
                make.top.equalTo(self.raceLabel!.snp.lastBaseline).offset(-self.effectTextFieldOffsetTopForiPhone5)
            })
            
            self.atkTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.defTextField!).offset(-self.atkTextFieldOffsetRightForiPhone5)
                make.bottom.equalTo(self.cardImageView!).offset(-self.atkTextFieldOffsetBottomForiPhone5)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.defTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetRightForiPhone5)
                make.bottom.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetBottomForiPhone5)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.raceView?.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.view)
                make.top.equalTo(self.cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
                make.width.equalTo(self.cardImageView!)
                make.height.equalTo(self.raceViewHeightForiPhone5)
            })
            break
        case iPhone6Height:
            self.nameTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetLeftForiPhone6)
                make.top.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetTopForiPhone6)
                make.height.equalTo(self.nameTextFieldHeight)
                make.right.equalTo(self.cardImageView!).offset(-self.nameTextFieldOffsetRightForiPhone6)
            })
            
            self.effectView?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.effectViewOffsetLeftForiPhone6)
                make.height.equalTo(self.effectViewHeightForiPhone6)
                make.right.equalTo(self.cardImageView!).offset(-self.effectViewOffsetRightForiPhone6)
                make.bottom.equalTo(self.cardImageView!).offset(-self.effectViewOffsetBottomForiPhone6)
            })
            
            self.raceLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(-self.raceLabelOffsetLeftForiPhone6)
                make.top.right.equalTo(self.effectView!)
            })
            
            self.effectTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(-self.effectTextFieldOffsetLeftForiPhone6)
                make.right.bottom.equalTo(self.effectView!)
                make.top.equalTo(self.raceLabel!.snp.lastBaseline).offset(-self.effectTextFieldOffsetTopForiPhone6)
            })
            
            self.atkTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.defTextField!).offset(-self.atkTextFieldOffsetRightForiPhone6)
                make.bottom.equalTo(self.cardImageView!).offset(-self.atkTextFieldOffsetBottomForiPhone6)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.defTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetRightForiPhone6)
                make.bottom.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetBottomForiPhone6)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.raceView?.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.view)
                make.top.equalTo(self.cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
                make.width.equalTo(self.cardImageView!)
                make.height.equalTo(self.raceViewHeightForiPhone6)
            })
            break
        case iPhone6PHeight:
            self.nameTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetLeftForiPhone6P)
                make.top.equalTo(self.cardImageView!).offset(self.nameTextFieldOffsetTopForiPhone6P)
                make.height.equalTo(self.nameTextFieldHeight)
                make.right.equalTo(self.cardImageView!).offset(-self.nameTextFieldOffsetRightForiPhone6P)
            })
            
            self.effectView?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.cardImageView!).offset(self.effectViewOffsetLeftForiPhone6P)
                make.height.equalTo(self.effectViewHeightForiPhone6P)
                make.right.equalTo(self.cardImageView!).offset(-self.effectViewOffsetRightForiPhone6P)
                make.bottom.equalTo(self.cardImageView!).offset(-self.effectViewOffsetBottomForiPhone6P)
            })
            
            self.raceLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(-self.raceLabelOffsetLeftForiPhone6P)
                make.top.right.equalTo(self.effectView!)
            })
            
            self.effectTextField?.snp.makeConstraints({ (make) in
                make.left.equalTo(self.effectView!).offset(self.effectTextFieldOffsetLeftForiPhone6P)
                make.right.bottom.equalTo(self.effectView!)
                make.top.equalTo(self.raceLabel!.snp.lastBaseline).offset(-effectTextFieldOffsetTopForiPhone6P)
            })
            
            self.atkTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.defTextField!).offset(-self.atkTextFieldOffsetRightForiPhone6P)
                make.bottom.equalTo(self.cardImageView!).offset(-self.atkTextFieldOffsetBottomForiPhone6P)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.defTextField?.snp.makeConstraints({ (make) in
                make.right.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetRightForiPhone6P)
                make.bottom.equalTo(self.cardImageView!).offset(-self.defTextFieldOffsetBottomForiPhone6P)
                make.width.equalTo(self.atkTextFieldWidth)
                make.height.equalTo(self.atkTextFieldHeight)
            })
            
            self.raceView?.snp.makeConstraints({ (make) in
                make.centerX.equalTo(self.view)
                make.top.equalTo(self.cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
                make.width.equalTo(self.cardImageView!)
                make.height.equalTo(self.raceViewHeightForiPhone6P)
            })
            break
        default:
            break
        }
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
        if SHYGOConfiguration.shared.hasEffect {
            switch SHYGOConfiguration.shared.type! {
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
            switch SHYGOConfiguration.shared.type! {
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

extension SHEffectViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        if (textField.text?.lengthOfBytes(using: .utf8))! > 4 {
            return false
        } else {
            return true
        }
    }
    
}
