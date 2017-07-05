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
    
    var cardContentView: UIView?
    var cardImageView: UIImageView?
    var attributeView: SHYGOAttributeView?
    var attributeHint: UIImageView?
    var monsterLevelView: SHMonsterLevelView?
    var magicTypeView: SHMagicTypeView?
    var trapTypeView: SHTrapTypeView?
    
    var nextButton: UIButton?
    var selectedAttribute: String = "a0"
    
    func nextButtonAction(sender: UIButton) {
        SHYGOConfiguration.sharedInstance.attribute = selectedAttribute
        let effectVC = SHEffectViewController()
        effectVC.cardImage = cardContentView?.currentImage()
        navigationController?.pushViewController(effectVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.sharedInstance.isBlackMonster() {
            monsterLevelView?.configLevelType(isBlack: true)
            attributeView?.isHidden = false
            attributeHint?.isHidden = false
            monsterLevelView?.isHidden = false
            magicTypeView?.isHidden = true
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isMonster() {
            monsterLevelView?.configLevelType(isBlack: false)
            attributeView?.isHidden = false
            monsterLevelView?.isHidden = false
            attributeHint?.isHidden = false
            magicTypeView?.isHidden = true
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
            trapTypeView?.isHidden = false
        }
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
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
            return view
        })()
        view.addSubview(monsterLevelView!)
        
        magicTypeView = ({
            let view = SHMagicTypeView()
            return view
        })()
        view.addSubview(magicTypeView!)
        
        trapTypeView = ({
            let view = SHTrapTypeView()
            return view
        })()
        view.addSubview(trapTypeView!)
    }
    
    func makeConstraints() {
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
            make.centerX.equalTo(cardImageView!)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(30)
        })
        
        magicTypeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(cardImageView!)
            make.top.equalTo((cardImageView?.snp.bottom)!).offset(30)
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
