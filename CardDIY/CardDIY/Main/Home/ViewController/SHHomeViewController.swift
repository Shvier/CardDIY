//
//  SHHomeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit
import SnapKit

class SHHomeViewController: UIViewController {
    
    let backgroundAlpha: CGFloat = 0.5
    
    var backgroundImageView: UIImageView?
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        sideMenuViewController.presentLeftMenuViewController()
    }
    
    func initUI() {
        configNavi()
        
        backgroundImageView = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "ygo_background.jpg")
            imageView.contentMode = .scaleAspectFill
            imageView.alpha = backgroundAlpha
            return imageView
        })()
        view.addSubview(backgroundImageView!)
        
        backgroundImageView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(kNavigationAndStatusBarHeight)
        })
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.title = "游戏王"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

