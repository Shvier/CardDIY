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
    
    let centerX = UIScreen.main.bounds.size.width/2
    let centerY = UIScreen.main.bounds.size.height/2
    let widthPerUnit: CGFloat = UIScreen.main.bounds.size.width/20
    let heightPerUnit: CGFloat = UIScreen.main.bounds.size.height/35
    
    let backgroundAlpha: CGFloat = 0.5
    
    lazy var cards: Array<String> = {
        return ["b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7"]
    }()
    
    var backgroundImageView: UIImageView?
    var hintLabel: UILabel?
    var cardMadeView: UICollectionView?
    var pageControl: SHYGOPageControl?
    var selectedIndex: NSInteger = 0
    
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
    
    func createBezierPath(startPoint: CGPoint, endPoint: CGPoint, controlPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.lineWidth = 5.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        return path
    }
    
    func initUI() {
        configNavi()
        view.backgroundColor = UIColor.black
        
        // Left Top to Center
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: ScreenWidth/2, y: ScreenHeight/2), controlPoint: CGPoint(x: ScreenWidth/20*14, y: ScreenHeight/35*5))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Center to Right Bottom
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*6, y: heightPerUnit*30))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Right Top to Center
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: 0), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*19, y: heightPerUnit*10))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Center to Left Bottom
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: 0, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*1, y: heightPerUnit*25))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // 2 Left to Center
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: 0, y: heightPerUnit*10), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*10))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Center to 2 Right
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: heightPerUnit*25), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*25))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // 3 Left to Center
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: 0, y: heightPerUnit*20), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*5, y: heightPerUnit*17))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Center to 3 Left
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: heightPerUnit*15), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*15, y: heightPerUnit*18))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // 2 Top to Center
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: widthPerUnit*13, y: 0), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*9))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        // Center to 2 Bottom
        repeat {
            let path = createBezierPath(startPoint: CGPoint(x: widthPerUnit*7, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*26))
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), movePath: path.cgPath)
            view.addSubview(particleView)
        } while (false)
        
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
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7779776531531575/8390171246")
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
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.rightBarItemAction(sender:)))
        navigationItem.rightBarButtonItem = rightBarItem
        
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        navigationItem.title = Bundle.main.localizedString(forKey: "YGO", value: "", table: nil)
//        navigationTitle = Bundle.main.localizedString(forKey: "YGO", value: "", table: nil)
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
