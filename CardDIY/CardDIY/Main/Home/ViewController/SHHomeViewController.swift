//
//  SHHomeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHHomeViewController: UIViewController {
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        sideMenuViewController.presentLeftMenuViewController()
    }
    
    func initUI() {
        configNavi()
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
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

