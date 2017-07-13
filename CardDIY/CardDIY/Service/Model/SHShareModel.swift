//
//  SHShareModel.swift
//  CardDIY
//
//  Created by shvier on 13/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHShareModel: NSObject {
    
    var image: UIImage
    var content: String
    var title: String
    
    init(image: UIImage, content: String, title: String) {
        self.image = image
        self.content = content
        self.title = title
    }

}
