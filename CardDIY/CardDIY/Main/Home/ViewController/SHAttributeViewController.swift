//
//  SHAttributeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHAttributeViewController: SHBaseViewController {
    
    var cardImageView: UIImageView?
    var attributeView: SHYGOAttributeView?
    var attributeHint: UIImageView?
    
    var nextButton: UIButton?
    
    func nextButtonAction(sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if SHYGOConfiguration.sharedInstance.type! < "b6" {
            attributeView?.isHidden = false
        } else {
            attributeView?.isHidden = true
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
        
        attributeView = ({
            let view = SHYGOAttributeView()
            return view
        })()
        view.addSubview(attributeView!)
        
        attributeHint = ({
            let imageView = UIImageView()
            return imageView
        })()
        view.addSubview(attributeHint!)
        
        nextButton = ({
            let button = UIButton(type: .system)
            button.setTitle("下一步", for: .normal)
            button.addTarget(self, action: #selector(self.nextButtonAction(sender:)), for: .touchUpInside)
            return button;
        })()
        view.addSubview(nextButton!)
    }
    
    func makeConstraints() {
        cardImageView?.snp.makeConstraints({ (make) in
            make.left.equalTo(view).offset(cardMadeViewMargin)
            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
            make.height.equalTo((cardImageView?.snp.width)!).multipliedBy(ratio)
        })
        
        attributeView?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-120)
        })
        
        attributeHint?.snp.makeConstraints({ (make) in
            
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
