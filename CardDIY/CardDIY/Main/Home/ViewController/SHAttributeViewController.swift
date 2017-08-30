//
//  SHAttributeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHAttributeViewController: SHBaseViewController {
    
    let atrributeMargin: CGFloat = 26*ScreenHeight/iPhone6PHeight - 2*(ScreenHeight <= iPhone6Height ? 1 : 0)
    let attributeLength: CGFloat = 31*ScreenHeight/iPhone6PHeight - 2*(ScreenHeight == iPhone5Height ? 1 : 0)
    func monsterLevelOffsetTop() -> CGFloat {
        switch ScreenHeight {
        case iPhone4Height:
            return 44
        case iPhone5Height:
            return 44
        case iPhone6Height:
            return 56
        case iPhone6PHeight:
            return 63.5
        default:
            return 0
        }
    }
    let magicTypeWordWidth: CGFloat = 92*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
    let magicTypeWordHeight: CGFloat = 22*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
    let magicTypeWordOffsetTop: CGFloat = 61
    let magicTypeWordOffsetTopForiPhone6: CGFloat = 52.5
    let magicTypeWordOffsetTopForiPhone5: CGFloat = 41
    let magicTypeWordOffsetTopForiPhone4: CGFloat = 42
    let magicTypeWordOffsetRight: CGFloat = 36
    let magicTypeWordOffsetRightForiPhone6: CGFloat = 32.5
    let magicTypeWordOffsetRightForiPhone4: CGFloat = 24
    let advMagicTypeWordWidth: CGFloat = 110*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
    let advMagicTypeHintOffsetTop: CGFloat = 66
    let advMagicTypeHintOffsetTopForiPhone6: CGFloat = 57
    let advMagicTypeHintOffsetTopForiPhone5: CGFloat = 44
    let advMagicTypeHintOffsetTopForiPhone4: CGFloat = 45
    let advMagicTypeHintOffsetRight: CGFloat = 41
    let advMagicTypeHintOffsetRightForiPhone6: CGFloat = 35
    let advMagicTypeHintOffsetRightForiPhone4: CGFloat = 26
    let advMagicTypeHintLength: CGFloat = 18*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
    let trapTypeWordWidth: CGFloat = 80*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
    let advTrapTypeWordWidth: CGFloat = 98*(ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)

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
    var trapTypeWordHint: UIImageView?
    var advTrapTypeWordHint: UIImageView?
    var advTrapTypeHint: UIImageView?
    
    var selectedAttribute: String = "a0"
    
    override func rightBarItemAction(sender: UIBarButtonItem) {
        monsterLevelView?.hideLevel()
        SHYGOConfiguration.shared.attribute = selectedAttribute
        let effectVC = SHEffectViewController()
        effectVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(effectVC, animated: true)
    }

    func hideTrapTypeHint(hide: Bool) {
        if hide {
            trapTypeView?.isHidden = true
            trapTypeWordHint?.isHidden = true
        } else {
            trapTypeView?.isHidden = false
            trapTypeWordHint?.isHidden = false
        }
    }
    
    func hideMagicTypeHint(hide: Bool) {
        if hide {
            magicTypeView?.isHidden = true
            magicTypeWordHint?.isHidden = true
        } else {
            magicTypeView?.isHidden = false
            magicTypeWordHint?.isHidden = false
        }
    }
    
    func hideMonsterHint(hide: Bool) {
        if hide {
            attributeView?.isHidden = true
            monsterLevelView?.isHidden = true
            attributeHint?.isHidden = true
        } else {
            monsterLevelView?.showAllLevel()
            attributeView?.isHidden = false
            monsterLevelView?.isHidden = false
            attributeHint?.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.shared.isXyzMonster() {
            monsterLevelView?.configLevelType(isBlack: true)
            
            hideMonsterHint(hide: false)
            hideMagicTypeHint(hide: true)
            hideTrapTypeHint(hide: true)
        } else if SHYGOConfiguration.shared.isMonster() {
            monsterLevelView?.configLevelType(isBlack: false)

            hideMonsterHint(hide: false)
            hideMagicTypeHint(hide: true)
            hideTrapTypeHint(hide: true)
        }
    }
    
    func initUI() {
        navigationTitle = LocalizedString(key: "YuGiOh")
        
        hintLabel = ({
            let label = UILabel()
            label.text = LocalizedString(key: "Please Fill Blanks of Card")
            label.textColor = UIColor.white
            label.font = UIFont(name: SHYGOConfiguration.shared.wordFontFamily(), size: hintLabelFontSize)
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
            imageView.image = UIImage(named: SHYGOConfiguration.shared.type!)
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
            view.delegate = self
            return view
        })()
        view.addSubview(trapTypeView!)
        
        trapTypeWordHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "trap")
            return imageView
        })()
        cardContentView!.addSubview(trapTypeWordHint!)
        
        advTrapTypeWordHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "trap_plus")
            imageView.isHidden = true
            return imageView
        })()
        cardContentView!.addSubview(advTrapTypeWordHint!)
        
        advTrapTypeHint = ({
            let imageView = UIImageView()
            imageView.isHidden = true
            return imageView
        })()
        cardContentView!.addSubview(advTrapTypeHint!)
    }
    
    func makeConstraints() {
        hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            if IsiPhone4() {
                make.bottom.equalTo(cardContentView!.snp.top).offset(hintLabelBottomMarginForiPhone4)
            } else {
                make.bottom.equalTo(cardContentView!.snp.top).offset(-hintLabelBottomMargin)
            }
        })
        
        cardContentView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.centerY.equalTo(view)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(cardContentView!)
        })
        
        attributeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            if IsiPhone4() {
                make.top.equalTo(cardContentView!.snp.bottom).offset(bottomViewoffsetTopForiPhone4)
            } else {
                make.top.equalTo(cardContentView!.snp.bottom).offset(bottomViewOffsetTop)
            }
        })
        
        attributeHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(atrributeMargin + 3)
                make.right.equalTo(cardImageView!).offset(-atrributeMargin - 3)
            } else {
                make.top.equalTo(cardImageView!).offset(atrributeMargin)
                make.right.equalTo(cardImageView!).offset(-atrributeMargin)
            }
            make.width.height.equalTo(attributeLength)
        })
        
        monsterLevelView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardContentView!)
            make.top.equalTo(cardImageView!).offset(monsterLevelOffsetTop())
        })
        
        magicTypeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardImageView!)
            if IsiPhone4() {
                make.top.equalTo(cardImageView!.snp.bottom).offset(bottomViewoffsetTopForiPhone4)
            } else {
                make.top.equalTo(cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
            }
        })
        
        magicTypeWordHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRight)
                }
            }
            make.width.equalTo(magicTypeWordWidth)
            make.height.equalTo(magicTypeWordHeight)
        })
        
        advMagicTypeWordHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRight)
                }
            }
            make.width.equalTo(advMagicTypeWordWidth)
            make.height.equalTo(magicTypeWordHeight)
        })
        
        advMagicTypeHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRight)
                }
            }
            make.width.height.equalTo(advMagicTypeHintLength)
        })
        
        trapTypeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardImageView!)
            if IsiPhone4() {
                make.top.equalTo(cardImageView!.snp.bottom).offset(bottomViewoffsetTopForiPhone4)
            } else {
                make.top.equalTo(cardImageView!.snp.bottom).offset(bottomViewOffsetTop)
            }
        })
        
        trapTypeWordHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRight)
                }
            }
            make.width.equalTo(trapTypeWordWidth)
            make.height.equalTo(magicTypeWordHeight)
        })
        
        advTrapTypeWordHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(magicTypeWordOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-magicTypeWordOffsetRight)
                }
            }
            make.width.equalTo(advTrapTypeWordWidth)
            make.height.equalTo(magicTypeWordHeight)
        })
        
        advTrapTypeHint?.snp.makeConstraints({ (make) in
            if IsiPhone4() {
                make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone4)
                make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone4)
            } else if IsiPhone5() {
                make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone5)
                make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone4)
            } else {
                if IsiPhone6() {
                    make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTopForiPhone6)
                    make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRightForiPhone6)
                } else {
                    make.top.equalTo(cardImageView!).offset(advMagicTypeHintOffsetTop)
                    make.right.equalTo(cardImageView!).offset(-advMagicTypeHintOffsetRight)
                }
            }
            make.width.height.equalTo(advMagicTypeHintLength)
        })
        
        if SHYGOConfiguration.shared.isMagic() {
            hideMonsterHint(hide: true)
            hideMagicTypeHint(hide: false)
            hideTrapTypeHint(hide: true)
        } else if SHYGOConfiguration.shared.isTrap() {
            hideMonsterHint(hide: true)
            hideMagicTypeHint(hide: true)
            hideTrapTypeHint(hide: false)
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

extension SHAttributeViewController: SHYGOTrapTypeViewDelegate {
    
    func trapTypeView(trapTypeView: SHTrapTypeView, buttonClicked sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            trapTypeWordHint?.isHidden = false
            advTrapTypeWordHint?.isHidden = true
            advTrapTypeHint?.isHidden = true
        } else {
            trapTypeWordHint?.isHidden = true
            advTrapTypeWordHint?.isHidden = false
            advTrapTypeHint?.isHidden = false
            trapTypeView.unselectButton(exclude: sender)
        }
        switch sender {
        case trapTypeView.antiButton!:
            advTrapTypeHint?.image = UIImage(named: "anti_selected")
            break
        case trapTypeView.infButton!:
            advTrapTypeHint?.image = UIImage(named: "inf_selected")
            break
        default:
            break
        }
    }
    
}
