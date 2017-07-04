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

}
