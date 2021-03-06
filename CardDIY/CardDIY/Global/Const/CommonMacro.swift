//
//  CommonMacro.swift
//  CardDIY
//
//  Created by shvier on 04/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let iPhoneXStatusBarIncrement: CGFloat = 24
let StatusBarHeight: CGFloat = 20
let NavigationAndStatusBarHeight: CGFloat = 64
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let iPhone4Height: CGFloat = 480
let iPhone5Height: CGFloat = 568
let iPhone6Height: CGFloat = 667
let iPhone6PHeight: CGFloat = 736
let iPhoneXHeight: CGFloat = 812
let HeightBetweeniPhonePAndX = iPhoneXHeight - iPhone6PHeight

let UMAppKey = "59673662717c1903a50001eb"
let AdMobLaunchID = "ca-app-pub-7779776531531575/8390171246"
let AdMobBannerHomeID = "ca-app-pub-7779776531531575/4587247709"
let AdMobBannerAttributeID = "ca-app-pub-7779776531531575/5708757688"
let AdMobBannerEffectID = "ca-app-pub-7779776531531575/9759683338"
let AdMobBannerAvatarID = "ca-app-pub-7779776531531575/7451771118"
let AppStoreURL = "https://itunes.apple.com/us/app/yugioh-card-maker/id1277547428?l=zh&ls=1&mt=8"
let FeedbackEmail = "Shvier@icloud.com"

let NormalMonsterColor  = UIColor(red:0.68, green:0.55, blue:0.38, alpha:1.00)
let EffectMonsterColor  = UIColor(red:0.68, green:0.37, blue:0.25, alpha:1.00)
let RitualMonsterColor  = UIColor(red:0.33, green:0.48, blue:0.71, alpha:1.00)
let FusionMonsterColor  = UIColor(red:0.47, green:0.31, blue:0.80, alpha:1.00)
let SynchroMonsterColor = UIColor(red:0.87, green:0.87, blue:0.87, alpha:1.00)
let XYZMonsterColor     = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.00)
let MagicColor          = UIColor(red:0.20, green:0.62, blue:0.50, alpha:1.00)
let TrapColor           = UIColor(red:0.70, green:0.28, blue:0.50, alpha:1.00)

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

func IsiPhoneX() -> Bool {
    return ScreenHeight == iPhoneXHeight
}

func screenHeight() -> CGFloat {
    if ScreenHeight == iPhoneXHeight {
        return iPhone6Height
    } else {
        return ScreenHeight
    }
}

func LocalizedString(key: String) -> String {
    return Bundle.main.localizedString(forKey: key, value: "", table: nil)
}
