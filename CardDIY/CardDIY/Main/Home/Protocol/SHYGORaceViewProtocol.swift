//
//  SHYGORaceViewProtocol.swift
//  CardDIY
//
//  Created by shvier on 08/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

protocol SHYGORaceViewDelegate: class {
 
    func raceView(didClicked cell: SHYGORaceCell, atIndexPath indexPath: IndexPath)
    
}
