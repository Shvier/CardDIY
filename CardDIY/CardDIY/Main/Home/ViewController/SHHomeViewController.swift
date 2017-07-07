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
    
    lazy var cards: Array<String> = {
        return ["b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7"]
    }()
    
    var backgroundImageView: UIImageView?
    var hintLabel: UILabel?
    var cardMadeView: UICollectionView?
    var pageControl: SHYGOPageControl?
    
    func selectedIndex() -> NSInteger {
        return NSInteger((cardMadeView?.contentOffset.x)!/(cardMadeView?.bounds.size.width)!)
    }
    
    func leftBarItemAction(sender: UIBarButtonItem) {
        sideMenuViewController.presentLeftMenuViewController()
    }
    
    func rightBarItemAction(sender: UIBarButtonItem) {
        SHYGOConfiguration.sharedInstance.type = cards[selectedIndex()]
        let attributeVC = SHAttributeViewController()
        navigationController?.pushViewController(attributeVC, animated: true)
    }
    
    func initUI() {
        configNavi()
        view.backgroundColor = UIColor.white
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
            make.top.equalTo(view).offset(kNavigationAndStatusBarHeight)
        })
        
        hintLabel = ({
            let label = UILabel()
            label.text = "请选择卡牌类型"
            label.font = UIFont(name: WordFontFamily, size: hintLabelFontSize)
            return label
        })()
        view.addSubview(hintLabel!)
        
//        let flowLayout: UICollectionViewFlowLayout = ({
//            let layout = UICollectionViewFlowLayout()
//            layout.minimumLineSpacing = 0
//            layout.minimumInteritemSpacing = 0
//            layout.scrollDirection = .horizontal
//            layout.itemSize = CGSize(width: view.frame.size.width - 2*cardMadeViewMargin, height: (view.frame.size.width - 2*cardMadeViewMargin)*ratio)
//            return layout
//        })()
        
        let flowLayout: SHYGOFlowLayout = ({
            let layout = SHYGOFlowLayout()
            layout.minimumLineSpacing = 60
//            layout.minimumInteritemSpacing = 60
            layout.scrollDirection = .horizontal
//            layout.itemSize = CGSize(width: view.frame.size.width - 2*cardMadeViewMargin, height: (view.frame.size.width - 2*cardMadeViewMargin)*ratio)
            let width = kScreenWidth-2*cardMadeViewMargin-100
            layout.itemSize = CGSize(width: width, height: width*ratio)
//            let width = kScreenWidth - 2*30
//            layout.itemSize = CGSize(width: width/2, height: width-100)
            layout.sectionInset = UIEdgeInsetsMake(0, (kScreenWidth-2*cardMadeViewMargin)/2 - 30, 0, (kScreenWidth-2*cardMadeViewMargin)/2 - 35)
            layout.delegate = self
            return layout
        })()
        
        cardMadeView = ({
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
            collectionView.register(SHYGOCardCell.self, forCellWithReuseIdentifier: SHYGOCardCellReuseIdentifier)
//            collectionView.isPagingEnabled = true
            collectionView.bounces = false
            collectionView.delegate = self
            collectionView.dataSource = self
//            collectionView.backgroundColor = UIColor.white
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            return collectionView
        })()
        view.addSubview(cardMadeView!)
        
        pageControl = ({
            let pageControl = SHYGOPageControl()
            pageControl.delegate = self
            pageControl.button1?.isSelected = true
            return pageControl
        })()
        view.addSubview(pageControl!)
    }
    
    func makeConstraints() {
        hintLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(cardMadeView!.snp.top).offset(-hintLabelBottomMargin)
        })
        
        cardMadeView?.snp.makeConstraints({ (make) in
//            make.left.equalTo(view).offset(cardMadeViewMargin)
//            make.right.equalTo(view).offset(-cardMadeViewMargin)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view).offset(-cardMadeViewBottomMargin)
//            make.height.equalTo((cardMadeView?.snp.width)!).multipliedBy(ratio)
            make.height.equalTo((kScreenWidth - 2*cardMadeViewMargin)*ratio)
        })
        
        pageControl?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(cardMadeView!.snp.bottom).offset(20)
        })
    }
    
    func configNavi() {
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.leftBarItemAction(sender:)))
        navigationItem.leftBarButtonItem = leftBarItem
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(self.rightBarItemAction(sender:)))
        navigationItem.rightBarButtonItem = rightBarItem
        navigationItem.title = "游戏王"
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
    }
    
}

extension SHHomeViewController: SHYGOPageControlDelegate {
    
    func pageControl(pageControl: SHYGOPageControl, buttonClicked sender: UIButton) {
        
    }
    
}
