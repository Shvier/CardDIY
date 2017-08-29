//
//  SHHomeViewController.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit
import SnapKit
import GoogleMobileAds

class SHHomeViewController: SHBaseViewController {
    
    let backgroundAlpha: CGFloat = 0.5
    
    lazy var cards: Array<String> = {
        return ["b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7"]
    }()
    
    lazy var menuWindow: SHMenuWindow = {
        return SHMenuWindow()
    }()
    
    var backgroundImageView: UIImageView?
    var hintLabel: UILabel?
    var cardMadeView: UICollectionView?
    var pageControl: SHYGOPageControl?
    var selectedIndex: NSInteger = 0
//    var whirlpoolView: SHWhirlpoolView!
    var gradientLayer: CAGradientLayer!
    
    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    var menuView: SHMenuView?
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        menuWindow.show()
    }
    
    override func rightBarItemAction(sender: UIBarButtonItem) {
        if selectedIndex <= 5 && selectedIndex >= 2 {
            let alertController = UIAlertController(title: LocalizedString(key: "Monster Card Selected"), message: LocalizedString(key: "Has effections?"), preferredStyle: .alert)
            let nopeAction = UIAlertAction(title: LocalizedString(key: "No"), style: .default, handler: { (UIAlertAction) in
                SHYGOConfiguration.shared.hasEffect = false
                self.pushNextController()
            })
            let okAction = UIAlertAction(title: LocalizedString(key: "Yes"), style: .default, handler: { (UIAlertAction) in
                SHYGOConfiguration.shared.hasEffect = true
                self.pushNextController()
            })
            alertController.addAction(nopeAction)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        } else {
            pushNextController()
        }
    }
    
    func pushNextController() {
        SHYGOConfiguration.shared.type = cards[selectedIndex]
        let attributeVC = SHAttributeViewController()
        navigationController?.pushViewController(attributeVC, animated: true)
    }

    func initUI() {
        configNavi()
        
        backgroundImageView = ({
            let imageView = UIImageView()
            imageView.image = UIImage(named: "card_back.jpg")
            imageView.contentMode = .scaleAspectFill
            imageView.alpha = backgroundAlpha
            imageView.isHidden = true
            return imageView
        })()
        view.addSubview(backgroundImageView!)
        
        backgroundImageView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(NavigationAndStatusBarHeight)
        })
        
//        whirlpoolView = SHWhirlpoolView(frame: view.bounds)
//        view.addSubview(whirlpoolView)
        
        let flowLayout: SHYGOFlowLayout = ({
            let layout = SHYGOFlowLayout()
            layout.minimumLineSpacing = 60
            layout.scrollDirection = .horizontal
            let width = ScreenWidth-2*cardMadeViewMargin-100
            layout.itemSize = CGSize(width: width, height: width*ratio)
            layout.sectionInset = UIEdgeInsetsMake(0, (ScreenWidth-2*cardMadeViewMargin)/2 - 30, 0, (ScreenWidth-2*cardMadeViewMargin)/2 - 35)
            layout.delegate = self
            return layout
        })()
        
        cardMadeView = ({
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
            collectionView.register(SHYGOCardCell.self, forCellWithReuseIdentifier: SHYGOCardCellReuseIdentifier)
            collectionView.bounces = false
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = UIColor.white
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.backgroundColor = UIColor.clear
            return collectionView
        })()
        view.addSubview(cardMadeView!)
        
        pageControl = ({
            let pageControl = SHYGOPageControl()
            pageControl.button1?.isSelected = true
            return pageControl
        })()
        view.addSubview(pageControl!)
        
        hintLabel = ({
            let label = UILabel()
            label.text = LocalizedString(key: "Please Select a Type of Card")
            label.textColor = UIColor.white
            label.font = UIFont(name: WordFontFamily, size: hintLabelFontSize)
            return label
        })()
        view.addSubview(hintLabel!)
        
        bannerView = ({
            let view = GADBannerView()
            view.adUnitID = AdMobBannerHomeID
            view.rootViewController = self
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID]
            view.load(request)
            return view
        })()
        view.addSubview(bannerView)
        
//        menuView = {
//            let view = navigationItem.leftBarButtonItem?.value(forKey: "view") as? UIView
//            let menuView = SHMenuView(frame: self.view.bounds, anchorPoint: CGPoint(x: (view?.center.x)!, y: (view?.center.y)! + StatusBarHeight), delegate: self)
//            menuView.isHidden = true
//            return menuView
//        }()
//        view.addSubview(menuView!)
        
        interstitial = GADInterstitial(adUnitID: AdMobLaunchID)
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        interstitial.load(request)
        interstitial.delegate = self
    }
    
    func makeConstraints() {
        hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            if IsiPhone4() {
                make.bottom.equalTo(cardMadeView!.snp.top).offset(hintLabelBottomMarginForiPhone4)
            } else {
                make.bottom.equalTo(cardMadeView!.snp.top).offset(-hintLabelBottomMargin)
            }
        })
        
        cardMadeView?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(view)
            if IsiPhone4() {
                make.bottom.equalTo(view).offset(-cardMadeViewBottomMarginForiPhone4)
            } else {
                make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
            }
            make.height.equalTo((ScreenWidth - 2*cardMadeViewMargin)*ratio)
        })
        
        pageControl?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            if IsiPhone4() {
                make.top.equalTo(cardMadeView!.snp.bottom).offset(-bottomViewoffsetTopForiPhone4)
            } else {
                make.top.equalTo(cardMadeView!.snp.bottom).offset(bottomViewOffsetTop)
            }
        })
        
        bannerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(80)
        }
    }
    
    override func configNavi() {
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "btn_left_bar_menu_visible")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(image: UIImage(named: "btn_right_bar_item")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(rightBarItemAction(sender:)))
        navigationItem.rightBarButtonItem = rightBarItem
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = LocalizedString(key: "YuGiOh")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        whirlpoolView.startAnimation()
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

extension SHHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SHYGOCardCellReuseIdentifier, for: indexPath) as! SHYGOCardCell
        collectionViewCell.imageView?.image = UIImage(named: cards[indexPath.row])
        return collectionViewCell
    }
    
}

extension SHHomeViewController: SHYGOFlowLayoutDelegate {
    
    func flowLayoutMovedTo(index: NSInteger) {
        pageControl?.unselected(exclude: index)
        selectedIndex = index
    }
    
}

extension SHHomeViewController: GADInterstitialDelegate {
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        ad.present(fromRootViewController: self)
    }
    
}

extension SHHomeViewController: SHMenuViewDelegate {
    
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
