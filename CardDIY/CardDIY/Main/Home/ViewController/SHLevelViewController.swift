//
//  SHLevelViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHLevelViewController: SHBaseViewController {
    
    var cardImageView: UIImageView?
    var monsterAttrHint: UIImageView?
    var monsterLevelView: SHMonsterLevelView?
    var magicTypeView: SHMagicTypeView?
    var trapTypeView: SHTrapTypeView?
    
    var nextButton: UIButton?
    
    func nextButtonAction(sender: UIButton) {
        let effectVC = SHEffectViewController()
        navigationController?.pushViewController(effectVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.sharedInstance.isBlackMonster() {
            monsterLevelView?.configLevelType(isBlack: true)
            monsterAttrHint?.isHidden = false
            monsterLevelView?.isHidden = false
            magicTypeView?.isHidden = true
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isMonster() {
            monsterLevelView?.configLevelType(isBlack: false)
            monsterLevelView?.isHidden = false
            monsterAttrHint?.isHidden = false
            magicTypeView?.isHidden = true
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isMagic() {
            monsterLevelView?.isHidden = true
            monsterAttrHint?.isHidden = true
            magicTypeView?.isHidden = false
            trapTypeView?.isHidden = true
        } else if SHYGOConfiguration.sharedInstance.isTrap() {
            monsterLevelView?.isHidden = true
            monsterAttrHint?.isHidden = true
            magicTypeView?.isHidden = true
            trapTypeView?.isHidden = false
        }
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        cardImageView = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: SHYGOConfiguration.sharedInstance.type!)
            return imageView
        })()
        view.addSubview(cardImageView!)
        
        monsterAttrHint = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: SHYGOConfiguration.sharedInstance.attribute!)
            return imageView
        })()
        view.addSubview(monsterAttrHint!)
        
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
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        monsterAttrHint?.snp.makeConstraints({ (make) in
            
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
