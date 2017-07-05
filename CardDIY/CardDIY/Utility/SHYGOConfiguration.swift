//
//  SHYGOConfiguration.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let cardMadeViewMargin: CGFloat = 80
let cardMadeViewBottomMargin: CGFloat = 150
let hintLabelBottomMargin: CGFloat = 50
let nextButtonTopMargin: CGFloat = 50
let ratio: CGFloat = 1.4576
let NumberFontFamily: String = "Book Antiqua"
let WordFontFamily: String = "HYXiaoLiShuF"
let NumberFontSize: CGFloat = 16
let WordFontSize: CGFloat = 16

class SHYGOConfiguration: NSObject {
    
    var type: String?
    var attribute: String?
    var level: NSInteger?
    var name: String?
    var effect: String?
    var atk: NSInteger?
    var def: NSInteger?
    var avatar: UIImage?
    
    static let sharedInstance = {
        return SHYGOConfiguration()
    }()
    
    func isMonster() -> Bool {
        return type! < "b6"
    }
    
    func isMagic() -> Bool {
        return type! == "b6"
    }
    
    func isTrap() -> Bool {
        return type! == "b7"
    }
    
    func isBlackMonster() -> Bool {
        return type! == "b5"
    }

}
