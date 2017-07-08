//
//  SHYGORaceView.swift
//  CardDIY
//
//  Created by shvier on 08/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHYGORaceView: SHBaseView {

    let buttonLength: CGFloat = 30
    let buttonCorner: CGFloat = 15
    let buttonMargin: CGFloat = 10
    
    lazy var races: [String] = {
        return ["aqua", "beast", "beast_warrior", "creator_god", "cyverse", "dinosaur", "divine_beast", "dragon", "fairy", "fiend", "fish", "insect", "machine", "plant", "psychic", "pyro", "reptile", "rock", "sea_serpent", "spellcaster", "thunder", "warrior", "winged_beast", "wyrm", "zombie"]
    }()
    
    var collectionView: UICollectionView?
    
    func initUI() {
        let layout: UICollectionViewFlowLayout = ({
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: buttonLength, height: buttonLength)
            flowLayout.scrollDirection = .vertical
            return flowLayout
        })()
        
        collectionView = ({
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            collectionView.register(SHYGORaceCell.self, forCellWithReuseIdentifier: SHYGORaceCellReuseIdentifier)
            collectionView.backgroundColor = UIColor.white
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        })()
        addSubview(collectionView!)
    }
    
    func makeConstraints() {
        collectionView?.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(self)
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension SHYGORaceView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let raceCell = collectionView.dequeueReusableCell(withReuseIdentifier: SHYGORaceCellReuseIdentifier, for: indexPath) as! SHYGORaceCell
        raceCell.configImage(name: races[indexPath.row])
        return raceCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return races.count
    }
    
}
