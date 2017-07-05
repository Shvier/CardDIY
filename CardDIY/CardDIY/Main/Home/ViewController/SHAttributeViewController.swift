//
//  SHAttributeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHAttributeViewController: SHBaseViewController {
    
    let atrributeMargin: CGFloat = 24
    let attributeLength: CGFloat = 25
    
    var hintLabel: UILabel?
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var attributeView: SHYGOAttributeView?
    var attributeHint: UIImageView?
    var monsterLevelView: SHMonsterLevelView?
    var magicTypeView: SHMagicTypeView?
    var trapTypeView: SHTrapTypeView?
    var magicTypeWordHint: UIImageView?
    var advMagicTypeWordHint: UIImageView?
    var advMagicTypeHint: UIImageView?
    
    var nextButton: UIButton?
    var selectedAttribute: String = "a0"
    
    func nextButtonAction(sender: UIButton) {
        monsterLevelView?.hideLevel()
        SHYGOConfiguration.sharedInstance.attribute = selectedAttribute
        let effectVC = SHEffectViewController()
        effectVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(effectVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.sharedInstance.isBlackMonster() {
            monsterLevelView?.configLevelType(isBlack: true)
            monsterLevelView?.showAllLevel()
            attributeView?.isHidden = false
            attributeHint?.isHidden = false
            monsterLevelView?.isHidden = false
            magicTypeView?.isHidden = true
            magicTypeWordHint?.isHidden = true
            advMagicTypeWordHint?.isHidden = true
            advMagicTypeHint?.isHidden = true
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isMonster() {
            monsterLevelView?.configLevelType(isBlack: false)
            monsterLevelView?.showAllLevel()
            attributeView?.isHidden = false
            monsterLevelView?.isHidden = false
            attributeHint?.isHidden = false
            magicTypeView?.isHidden = true
            magicTypeWordHint?.isHidden = true
            advMagicTypeWordHint?.isHidden = true
            advMagicTypeHint?.isHidden = true
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isMagic() {
            attributeView?.isHidden = true
            monsterLevelView?.isHidden = true
            attributeHint?.isHidden = true
            magicTypeView?.isHidden = false
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isTrap() {
            attributeView?.isHidden = true
            monsterLevelView?.isHidden = true
            attributeHint?.isHidden = true
            magicTypeView?.isHidden = true
            magicTypeWordHint?.isHidden = true
            advMagicTypeWordHint?.isHidden = true
            advMagicTypeHint?.isHidden = true
            trapTypeView?.isHidden = false
        }
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        hintLabel = ({
            let label = UILabel()
            label.text = "请补充卡牌信息"
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
            imageView.image = UIImage(named: SHYGOConfiguration.sharedInstance.type!)
            return imageView
        })()
        cardContentView!.addSubview(cardImageView!)
        
        attributeView = ({
            let view = SHYGOAttributeView()
            view.delegate = self
            return view
        })()
        view.addSubview(attributeView!)
        
        attributeHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "a0")
            return imageView
        })()
        cardContentView!.addSubview(attributeHint!)
        
        nextButton = ({
            let button = UIButton(type: .system)
            button.setTitle("下一步", for: .normal)
            button.addTarget(self, action: #selector(self.nextButtonAction(sender:)), for: .touchUpInside)
            return button;
        })()
        view.addSubview(nextButton!)
        
        monsterLevelView = ({
            let view = SHMonsterLevelView()
            view.delegate = self
            return view
        })()
        cardContentView!.addSubview(monsterLevelView!)
        
        magicTypeView = ({
            let view = SHMagicTypeView()
            view.delegate = self
            return view
        })()
        view.addSubview(magicTypeView!)
        
        magicTypeWordHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "magic")
            return imageView
        })()
        cardContentView!.addSubview(magicTypeWordHint!)
        
        advMagicTypeWordHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "magic_plus")
            imageView.isHidden = true
            return imageView
        })()
        cardContentView!.addSubview(advMagicTypeWordHint!)
        
        advMagicTypeHint = ({
            let imageView = UIImageView()
            imageView.isHidden = true
            return imageView
        })()
        cardContentView!.addSubview(advMagicTypeHint!)
        
        trapTypeView = ({
            let view = SHTrapTypeView()
            return view
        })()
        view.addSubview(trapTypeView!)
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
        
        attributeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-120)
        })
        
        attributeHint?.snp.makeConstraints({ (make) in
            make.top.equalTo(cardImageView!).offset(atrributeMargin)
            make.right.equalTo(cardImageView!).offset(-atrributeMargin)
            make.width.height.equalTo(attributeLength)
        })
        
        nextButton?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(nextButtonTopMargin)
        })
        
        monsterLevelView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardContentView!)
            make.top.equalTo(cardImageView!).offset(57)
        })
        
        magicTypeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardImageView!)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(30)
        })
        
        magicTypeWordHint?.snp.makeConstraints({ (make) in
            make.top.equalTo(cardImageView!).offset(57)
            make.right.equalTo(cardImageView!).offset(-30)
            make.width.equalTo(60)
            make.height.equalTo(15)
        })
        
        advMagicTypeWordHint?.snp.makeConstraints({ (make) in
            make.top.equalTo(cardImageView!).offset(57)
            make.right.equalTo(cardImageView!).offset(-30)
            make.width.equalTo(80)
            make.height.equalTo(15)
        })
        
        advMagicTypeHint?.snp.makeConstraints({ (make) in
            make.top.equalTo(cardImageView!).offset(57)
            make.right.equalTo(cardImageView!).offset(-30)
            make.width.height.equalTo(15)
        })
        
        trapTypeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardImageView!)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(30)
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

extension SHAttributeViewController: SHYGOAttributeViewDelegate {
    
    func attributeView(attributeView: SHYGOAttributeView, buttonClicked sender: UIButton) {
        switch sender {
        case attributeView.darkButton!:
            attributeHint?.image = UIImage(named: "a0")
            break
        case attributeView.lightButton!:
            attributeHint?.image = UIImage(named: "a1")
            break
        case attributeView.earthButton!:
            attributeHint?.image = UIImage(named: "a2")
            break
        case attributeView.windButton!:
            attributeHint?.image = UIImage(named: "a3")
            break
        case attributeView.waterButton!:
            attributeHint?.image = UIImage(named: "a4")
            break
        case attributeView.fireButton!:
            attributeHint?.image = UIImage(named: "a5")
            break
        case attributeView.godButton!:
            attributeHint?.image = UIImage(named: "a6")
            break
        default:
            break
        }
    }
    
}

extension SHAttributeViewController: SHYGOMonsterLevelViewDelegate {
    
    func monsterLevelView(monsterLevelView: SHMonsterLevelView, buttonClicked sender: UIButton) {
        switch sender {
        case monsterLevelView.level1!:
            monsterLevelView.configLevel(level: 1)
            break
        case monsterLevelView.level2!:
            monsterLevelView.configLevel(level: 2)
            break
        case monsterLevelView.level3!:
            monsterLevelView.configLevel(level: 3)
            break
        case monsterLevelView.level4!:
            monsterLevelView.configLevel(level: 4)
            break
        case monsterLevelView.level5!:
            monsterLevelView.configLevel(level: 5)
            break
        case monsterLevelView.level6!:
            monsterLevelView.configLevel(level: 6)
            break
        case monsterLevelView.level7!:
            monsterLevelView.configLevel(level: 7)
            break
        case monsterLevelView.level8!:
            monsterLevelView.configLevel(level: 8)
            break
        case monsterLevelView.level9!:
            monsterLevelView.configLevel(level: 9)
            break
        case monsterLevelView.level10!:
            monsterLevelView.configLevel(level: 10)
            break
        case monsterLevelView.level11!:
            monsterLevelView.configLevel(level: 11)
            break
        case monsterLevelView.level12!:
            monsterLevelView.configLevel(level: 12)
            break
        default:
            break
        }
    }
    
}

extension SHAttributeViewController: SHYGOMagicTypeViewDelegate {
    
    func magicTypeView(magicTypeView: SHMagicTypeView, buttonClicked sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            magicTypeWordHint?.isHidden = false
            advMagicTypeWordHint?.isHidden = true
            advMagicTypeHint?.isHidden = true
        } else {
            magicTypeWordHint?.isHidden = true
            advMagicTypeWordHint?.isHidden = false
            advMagicTypeHint?.isHidden = false
            magicTypeView.unselectButton(exclude: sender)
        }
        switch sender {
        case magicTypeView.infButton!:
            advMagicTypeHint?.image = UIImage(named: "inf_selected")
            break
        case magicTypeView.thunderButton!:
            advMagicTypeHint?.image = UIImage(named: "thunder_selected")
            break
        case magicTypeView.crossButton!:
            advMagicTypeHint?.image = UIImage(named: "cross_selected")
            break
        case magicTypeView.compassButton!:
            advMagicTypeHint?.image = UIImage(named: "compass_selected")
            break
        case magicTypeView.fireButton!:
            advMagicTypeHint?.image = UIImage(named: "fire_selected")
            break
        default:
            break
        }
    }
    
}
