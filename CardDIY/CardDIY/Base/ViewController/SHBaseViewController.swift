//
//  SHBaseViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit
import SnapKit

class SHBaseViewController: UIViewController {
    
    var navigationTitle: String {
        set {
            navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: hintLabelFontSize)!]
            navigationItem.title = newValue
        }
        get {
            return ""
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.sh_setBackgroundColor(UIColor.clear)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.sh_reset()
    }
    
    func leftBarItem(barItem: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    func rightBarItem(barItem: UIBarButtonItem) {
        
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(leftBarItem(barItem:)))
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(rightBarItem(barItem:)))
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
