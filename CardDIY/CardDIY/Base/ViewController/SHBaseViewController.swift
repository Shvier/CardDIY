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
    
    let animateLayerDuration: TimeInterval = 0.5
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
    var operationQueue: OperationQueue!
    
    var navigationTitle: String {
        set {
            navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: hintLabelFontSize)!, NSForegroundColorAttributeName: UIColor.white]
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
        UIView.animate(withDuration: animateLayerDuration, delay: 0, options: .allowUserInteraction, animations: { 
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
//        animateOperation = BlockOperation(block: { [unowned self] in
//            self.animateLayer()
//        })
//        operationQueue = OperationQueue()
//        operationQueue.addOperation(animateOperation)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.sh_reset()
//        animateOperation.cancel()
//        operationQueue.cancelAllOperations()
    }
    
    func leftBarItem(barItem: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    func rightBarItemAction(sender: UIBarButtonItem) {
        
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "btn_cancel")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftBarItem(barItem:)))
        let rightBarItem = UIBarButtonItem(image: UIImage(named: "btn_right_bar_item")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(rightBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.randomColor(colors: colors)
        view.backgroundColor = UIColor.black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        configNavi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("deinit")
    }

}

extension SHBaseViewController: UIGestureRecognizerDelegate {
    
}
