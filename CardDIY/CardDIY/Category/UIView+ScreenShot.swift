//
//  UIView+ScreenShot.swift
//  CardDIY
//
//  Created by shvier on 05/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

extension UIView {
    
    func currentImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
