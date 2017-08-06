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
    let animateLayerDuration: TimeInterval = 3.5
    
    lazy var cards: Array<String> = {
        return ["b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7"]
    }()
    
    let colors: [UIColor] = [NormalMonsterColor,
                             EffectMonsterColor,
                             RitualMonsterColor,
                             FusionMonsterColor,
                             SynchroMonsterColor,
                             XYZMonsterColor,
                             MagicColor,
                             TrapColor]
    
    var backgroundImageView: UIImageView?
    var hintLabel: UILabel?
    var cardMadeView: UICollectionView?
    var pageControl: SHYGOPageControl?
    var selectedIndex: NSInteger = 0
//    var whirlpoolView: SHWhirlpoolView!
    var gradientLayer: CAGradientLayer!
    var nextColor: UIColor!
    
    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        sideMenuViewController.presentLeftMenuViewController()
    }
    
    func rightBarItemAction(sender: UIBarButtonItem) {
        if selectedIndex <= 5 && selectedIndex >= 2 {
            let alertController = UIAlertController(title: "选择了怪兽卡", message: "是否拥有效果", preferredStyle: .alert)
            let nopeAction = UIAlertAction(title: "没有", style: .default, handler: { (UIAlertAction) in
                SHYGOConfiguration.shared.hasEffect = false
                self.pushNextController()
            })
            let okAction = UIAlertAction(title: "有", style: .default, handler: { (UIAlertAction) in
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
    
    func animateLayer() {
        UIView.animate(withDuration: animateLayerDuration, animations: {
            self.setupRandomColor()
        }) { (finished) in
            if finished {
                self.animateLayer()
            }
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

    func initUI() {
        configNavi()
        
        DispatchQueue.main.async { 
            self.animateLayer()
        }
        
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
            label.text = "请选择卡牌类型"
            label.textColor = UIColor.white
            label.font = UIFont(name: WordFontFamily, size: hintLabelFontSize)
            return label
        })()
        view.addSubview(hintLabel!)
        
        bannerView = ({
            let view = GADBannerView()
            view.adUnitID = "ca-app-pub-7779776531531575/8669372844"
            view.rootViewController = self
            let request = GADRequest()
            request.testDevices = [kGADSimulatorID]
            view.load(request)
            return view
        })()
        view.addSubview(bannerView)
        
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7779776531531575/8390171246")
//        let request = GADRequest()
//        request.testDevices = [kGADSimulatorID]
//        interstitial.load(request)
//        interstitial.delegate = self
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
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.rightBarItemAction(sender:)))
        navigationItem.rightBarButtonItem = rightBarItem
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = Bundle.main.localizedString(forKey: "YGO", value: "", table: nil)
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
