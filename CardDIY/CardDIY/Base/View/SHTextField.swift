//
//  SHTextField.swift
//  CardDIY
//
//  Created by shvier on 08/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftViewMode = .always
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 0
        rect.origin.y = 0
        return rect
    }

}
