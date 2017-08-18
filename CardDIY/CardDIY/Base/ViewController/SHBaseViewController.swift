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
    
    let animateLayerDuration: TimeInterval = 3.5
    let colors: [UIColor] = [NormalMonsterColor,
                             EffectMonsterColor,
                             RitualMonsterColor,
                             FusionMonsterColor,
                             SynchroMonsterColor,
                             XYZMonsterColor,
                             MagicColor,
                             TrapColor]
    
    var nextColor: UIColor!
    var animateOperation: Operation!
    
    var navigationTitle: String {
        set {
            navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: hintLabelFontSize)!]
            navigationItem.title = newValue
        }
        get {
            return ""
        }
    }
    
    func setupRandomColor() {
        nextColor = UIColor.randomColor(colors: colors)
        if view.backgroundColor == nextColor {
            setupRandomColor()
        } else {
            self.view.backgroundColor = nextColor
        }
    }
    
    func animateLayer() {
        UIView.animate(withDuration: animateLayerDuration, animations: {
            self.setupRandomColor()
        }) { (finished) in
            if finished {
                self.animateLayer()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.sh_setBackgroundColor(UIColor.clear)
        navigationController?.navigationBar.shadowImage = UIImage()
//        animateOperation = BlockOperation(block: { 
//            self.animateLayer()
//        })
//        OperationQueue.main.addOperation(animateOperation)
//        DispatchQueue.main.async {
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.sh_reset()
//        animateOperation.cancel()
//        animateOperation = nil
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
        view.backgroundColor = UIColor.randomColor(colors: colors)
        configNavi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
