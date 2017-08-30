//
//  SHYGOConfiguration.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let cardMadeViewMargin: CGFloat = 60
let cardMadeViewBottomMargin: CGFloat = 150
let cardMadeViewBottomMarginForiPhone4: CGFloat = 75
let hintLabelBottomMargin: CGFloat = 20
let hintLabelBottomMarginForiPhone4: CGFloat = 30
let nextButtonTopMargin: CGFloat = 50
let ratio: CGFloat = 1.45787
let NumberFontFamily: String = "Book Antiqua"
let WordFontFamily: String = "HYXiaoLiShuF"
let offsetRatio: CGFloat = (ScreenHeight - 2*cardMadeViewMargin)/(iPhone6PHeight - 2*cardMadeViewMargin)
let NumberFontSize: CGFloat = 12*offsetRatio
let WordFontSize: CGFloat = 24*offsetRatio
let EffectFontSize: CGFloat = 10*offsetRatio
let hintLabelFontSize: CGFloat = 24*offsetRatio
let bottomViewOffsetTop: CGFloat = 20
let bottomViewoffsetTopForiPhone4: CGFloat = 5

class SHYGOConfiguration: NSObject {
    
    var type: String?
    var attribute: String?
    var level: NSInteger?
    var name: String?
    var effect: String?
    var atk: NSInteger?
    var def: NSInteger?
    var avatar: UIImage?
    var hasEffect: Bool = true
    
    static let shared = {
        return SHYGOConfiguration()
    }()
    
    func isNormalMonster() -> Bool {
        return type! == "b0"
    }
    
    func isEffectMonster() -> Bool {
        return type! == "b1"
    }
    
    func isRitualMonster() -> Bool {
        return type! == "b2"
    }
    
    func isFusionMonster() -> Bool {
        return type! == "b3"
    }
    
    func isSynchroMonster() -> Bool {
        return type! == "b4"
    }
    
    func isXyzMonster() -> Bool {
        return type! == "b5"
    }
    
    func isMonster() -> Bool {
        return type! < "b6"
    }
    
    func isMagic() -> Bool {
        return type! == "b6"
    }
    
    func isTrap() -> Bool {
        return type! == "b7"
    }
    
    func wordFontFamily() -> String {
        if Locale.preferredLanguages.first! == "ja" {
            return "PingFangSC-Semibold"
        } else {
            return WordFontFamily
        }
    }

}
