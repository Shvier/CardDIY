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
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "btn_left_bar_menu_invisible")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftBarItemAction(sender:)))
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
        UIApplication.shared.openURL(URL(string: AppStoreURL)!)
    }
    
    func menuViewDidRecommendButtonClicked(_ menuView: SHMenuView) {
        let title = LocalizedString(key: "YuGiOh Card Maker")
        let content = LocalizedString(key: "I made my own YuGiOh Card. Come on and have a look.")
        let url = URL(string: AppStoreURL)!
        let image = UIImage(named: "AppLogo")!
        let activityViewController = UIActivityViewController(activityItems: [title, content, url, image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    func menuViewDidFeedbackButtonClicked(_ menuView: SHMenuView) {
        let subject = LocalizedString(key: "Feedback")
        let url = URL(string: "mailto:\(FeedbackEmail)?subject=\(subject)")
        UIApplication.shared.openURL(url!)
    }
    
    func menuViewDidVersionButtonClicked(_ menuView: SHMenuView) {
        
    }
    
    func menuViewDidAboutButtonClicked(_ menuView: SHMenuView) {
        
    }
    
}

class SHMenuWindow: NSObject {
    
    var viewController: SHMenuViewController!
    var containerWindow: UIWindow!
        
    static func show() -> SHMenuWindow {
        let menuWindow = SHMenuWindow()
        menuWindow.show()
        return menuWindow
    }
    
    func show() {
        viewController = SHMenuViewController()
        viewController.delegate = self
        containerWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        let naviController = UINavigationController(rootViewController: viewController)
        containerWindow.rootViewController = naviController
        containerWindow.isHidden = false;
    }
    
    func hide() {
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
