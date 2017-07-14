//
//  CommonMacro.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let NavigationAndStatusBarHeight: CGFloat = 64
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let iPhone4Height: CGFloat = 480
let iPhone5Height: CGFloat = 568
let iPhone6Height: CGFloat = 667
let iPhone6PHeight: CGFloat = 736

let UMAppKey = "59673662717c1903a50001eb"
let AdMobID = "ca-app-pub-7779776531531575~7426958844"
let AppUrl = ""

func IsiPhone4() -> Bool {
    return ScreenHeight == iPhone4Height
}

func IsiPhone5() -> Bool {
    return ScreenHeight == iPhone5Height
}

func IsiPhone6() -> Bool {
    return ScreenHeight == iPhone6Height
}

func IsiPhone6P() -> Bool {
    return ScreenHeight == iPhone6PHeight
}
