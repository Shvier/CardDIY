//
//  SHBezierView.swift
//  ParticleExample
//
//  Created by shvier on 24/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHBezierView: UIView {
    
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    let centerX = UIScreen.main.bounds.size.width/2
    let centerY = UIScreen.main.bounds.size.height/2
    let widthPerUnit: CGFloat = UIScreen.main.bounds.size.width/20
    let heightPerUnit: CGFloat = UIScreen.main.bounds.size.height/35

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let color = UIColor.orange
        color.set()
        let path = UIBezierPath()
        path.lineWidth = 5.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        // Left Top to Center
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*14, y: heightPerUnit*5))
        // Center to Right Bottom
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addQuadCurve(to: CGPoint(x: ScreenWidth, y: ScreenHeight), controlPoint: CGPoint(x: widthPerUnit*6, y: heightPerUnit*30))
        // Right Top to Center
        path.move(to: CGPoint(x: ScreenWidth, y: 0))
        path.addQuadCurve(to: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*19, y: heightPerUnit*10))
        // Center to Left Bottom
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addQuadCurve(to: CGPoint(x: 0, y: ScreenHeight), controlPoint: CGPoint(x: widthPerUnit*1, y: heightPerUnit*25))
        // 2 Left to Center
        path.move(to: CGPoint(x: 0, y: heightPerUnit*10))
        path.addQuadCurve(to: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*10))
        // Center to 2 Right
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addQuadCurve(to: CGPoint(x: ScreenWidth, y: heightPerUnit*25), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*25))
        // 3 Left to Center
        path.move(to: CGPoint(x: 0, y: heightPerUnit*20))
        path.addQuadCurve(to: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*5, y: heightPerUnit*17))
        // Center to 3 Left
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addQuadCurve(to: CGPoint(x: ScreenWidth, y: heightPerUnit*15), controlPoint: CGPoint(x: widthPerUnit*15, y: heightPerUnit*18))
        // 2 Top to Center
        path.move(to: CGPoint(x: widthPerUnit*13, y: 0))
        path.addQuadCurve(to: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*9))
        // Center to 2 Bottom
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addQuadCurve(to: CGPoint(x: widthPerUnit*7, y: ScreenHeight), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*26))
        path.stroke()
    }

}
