//
//  SHMenuWindow.swift
//  CardDIY
//
//  Created by Shvier on 21/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

protocol SHMenuViewControllerDelegate: class {
    
    func menuViewControllerDidLeftBarItemClicked()
    
}

class SHMenuViewController: UIViewController {
    
    weak var delegate: SHMenuViewControllerDelegate?
    
    var menuView: SHMenuView!
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        delegate?.menuViewControllerDidLeftBarItemClicked()
    }
    
    func initUI() {
        view.backgroundColor = UIColor.clear
        menuView = {
            let view = navigationItem.leftBarButtonItem?.value(forKey: "view") as? UIView
            let menuView = SHMenuView(frame: self.view.bounds, anchorPoint: CGPoint(x: (view?.center.x)!, y: (view?.center.y)! + StatusBarHeight), delegate: self)
            return menuView
        }()
        view.addSubview(menuView)
        menuView.present(completion: nil)
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "btn_left_bar_menu")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        
        navigationController?.navigationBar.sh_setBackgroundColor(UIColor.clear)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SHMenuViewController: SHMenuViewDelegate {
    
    func menuViewDidEvaluateButtonClicked(_ menuView: SHMenuView) {
        
    }
    
    func menuViewDidRecommendButtonClicked(_ menuView: SHMenuView) {
        
    }
    
    func menuViewDidFeedbackButtonClicked(_ menuView: SHMenuView) {
        
    }
    
    func menuViewDidVersionButtonClicked(_ menuView: SHMenuView) {
        
    }
    
    func menuViewDidAboutButtonClicked(_ menuView: SHMenuView) {
        
    }
    
}

class SHMenuWindow: NSObject {
    
    static let shared = SHMenuWindow()
    
    lazy var viewController: SHMenuViewController = {
        let menuViewController = SHMenuViewController()
        menuViewController.delegate = self
        return menuViewController
    }()
    var containerWindow: UIWindow!
        
    static func show() {
        shared.show()
    }
    
    static func hide() {
        shared.hide()
    }
    
    func show() {
        if containerWindow == nil {
            containerWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
            let naviController = UINavigationController(rootViewController: viewController)
            containerWindow.rootViewController = naviController
        }
        containerWindow.isHidden = false;
    }
    
    func hide() {
        if containerWindow == nil {
            return
        }
        containerWindow.isHidden = true
    }

}

extension SHMenuWindow: SHMenuViewControllerDelegate {
    
    func menuViewControllerDidLeftBarItemClicked() {
        viewController.menuView.dismiss { [unowned self] in
            self.hide()
        }
    }
    
}
