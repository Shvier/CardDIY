//
//  SHMonsterLevelView.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHMonsterLevelView: SHBaseView {
    
    let buttonMargin: CGFloat = 1
    let buttonLength: CGFloat = 16
    let buttonCorner: CGFloat = 8

    lazy var levelButtons: [UIButton] = {
        return Array<UIButton>()
    }()
    
    var isBlack: Bool = false
    var selectedLevel: NSInteger = 0
    weak var delegate: SHYGOMonsterLevelViewDelegate?
    
    var level1: UIButton?
    var level2: UIButton?
    var level3: UIButton?
    var level4: UIButton?
    var level5: UIButton?
    var level6: UIButton?
    var level7: UIButton?
    var level8: UIButton?
    var level9: UIButton?
    var level10: UIButton?
    var level11: UIButton?
    var level12: UIButton?
    
    func buttonAction(sender: UIButton) {
        delegate?.monsterLevelView(monsterLevelView: self, buttonClicked: sender)
    }
    
    func hideLevel() {
        if selectedLevel == 0 {
            for button in levelButtons {
                button.isHidden = true
            }
            return
        }
        if isBlack {
            for index in 0...(selectedLevel - 1) {
                let button = levelButtons[index]
                button.isHidden = false
            }
            for index in selectedLevel..<levelButtons.count {
                let button = levelButtons[index]
                button.isHidden = true
            }
        } else {
            for index in (selectedLevel - 1)..<levelButtons.count {
                let button = levelButtons[index]
                button.isHidden = false
            }
            for index in 0..<(selectedLevel - 1) {
                let button = levelButtons[index]
                button.isHidden = true
            }
        }
    }
    
    func showAllLevel() {
        for button in levelButtons {
            button.isHidden = false
        }
    }
    
    func configLevel(level: NSInteger) {
        selectedLevel = level
        if isBlack {
            for index in 0...(level - 1) {
                let button = levelButtons[index]
                button.isSelected = true
            }
            for index in level..<levelButtons.count {
                let button = levelButtons[index]
                button.isSelected = false
            }
        } else {
            for index in (level - 1)..<levelButtons.count {
                let button = levelButtons[index]
                button.isSelected = true
            }
            for index in 0..<(level - 1) {
                let button = levelButtons[index]
                button.isSelected = false
            }
        }
    }
    
    func configLevelType(isBlack: Bool) {
        self.isBlack = isBlack
        if isBlack {
            for button in levelButtons {
                button.setImage(UIImage(named: "ds_normal"), for: .normal)
                button.setImage(UIImage(named: "ds_selected"), for: .selected)
            }
        } else {
            for button in levelButtons {
                button.setImage(UIImage(named: "level_normal"), for: .normal)
                button.setImage(UIImage(named: "level_selected"), for: .selected)
            }
        }
    }
    
    func initUI() {
        level1 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level1!)
        levelButtons.append(level1!)
        
        level2 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level2!)
        levelButtons.append(level2!)
        
        level3 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level3!)
        levelButtons.append(level3!)
        
        level4 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level4!)
        levelButtons.append(level4!)
        
        level5 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level5!)
        levelButtons.append(level5!)
        
        level6 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level6!)
        levelButtons.append(level6!)
        
        level7 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level7!)
        levelButtons.append(level7!)
        
        level8 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level8!)
        levelButtons.append(level8!)
        
        level9 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level9!)
        levelButtons.append(level9!)
        
        level10 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level10!)
        levelButtons.append(level10!)
        
        level11 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level11!)
        levelButtons.append(level11!)
        
        level12 = ({
            let button = UIButton(type: .custom)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonCorner
            button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
            return button
        })()
        addSubview(level12!)
        levelButtons.append(level12!)
    }
    
    func makeConstraints() {
        level1?.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.width.height.equalTo(buttonLength)
        })
        
        level2?.snp.makeConstraints({ (make) in
            make.left.equalTo((level1?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level3?.snp.makeConstraints({ (make) in
            make.left.equalTo((level2?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level4?.snp.makeConstraints({ (make) in
            make.left.equalTo((level3?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level5?.snp.makeConstraints({ (make) in
            make.left.equalTo((level4?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level6?.snp.makeConstraints({ (make) in
            make.left.equalTo((level5?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level7?.snp.makeConstraints({ (make) in
            make.left.equalTo((level6?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level8?.snp.makeConstraints({ (make) in
            make.left.equalTo((level7?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level9?.snp.makeConstraints({ (make) in
            make.left.equalTo((level8?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level10?.snp.makeConstraints({ (make) in
            make.left.equalTo((level9?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level11?.snp.makeConstraints({ (make) in
            make.left.equalTo((level10?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
        })
        
        level12?.snp.makeConstraints({ (make) in
            make.left.equalTo((level11?.snp.right)!).offset(buttonMargin)
            make.top.bottom.equalTo(level1!)
            make.width.equalTo(buttonLength)
            make.right.equalTo(self)
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
