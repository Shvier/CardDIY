//
//  UIColor+Extension.swift
//  CardDIY
//
//  Created by Shvier on 06/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func randomColor(colors: [UIColor]) -> UIColor {
        let index = arc4random_uniform(UInt32(colors.count))
        return colors[Int(index)]
    }
    
}
