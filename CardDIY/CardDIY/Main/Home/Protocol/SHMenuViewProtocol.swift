//
//  SHMenuViewProtocol.swift
//  CardDIY
//
//  Created by Shvier on 16/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

protocol SHMenuViewDelegate: class {
    
    func menuViewDidEvaluateButtonClicked(_ menuView: SHMenuView)
    func menuViewDidRecommendButtonClicked(_ menuView: SHMenuView)
    func menuViewDidFeedbackButtonClicked(_ menuView: SHMenuView)
    func menuViewDidVersionButtonClicked(_ menuView: SHMenuView)
    func menuViewDidAboutButtonClicked(_ menuView: SHMenuView)
    func menuViewShouldDismiss(_ menuView: SHMenuView)
    
}
