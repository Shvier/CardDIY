//
//  SHAnimationGroup.swift
//  CardDIY
//
//  Created by Shvier on 16/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let offset: CGFloat = 10

class SHAnimationGroup: NSObject {
    
    static func animateView(_ view: UIButton, fromPoint start: CGPoint, toPoint end: CGPoint, duration: CFTimeInterval) -> CAAnimationGroup {
        let movePath = UIBezierPath()
        movePath.move(to: start)
        movePath.addQuadCurve(to: end, controlPoint: CGPoint(x: end.x - offset, y: end.y - offset))
        movePath.addQuadCurve(to: end, controlPoint: CGPoint(x: end.x + offset, y: end.y + offset))
        
        let translateAnimation = CAKeyframeAnimation(keyPath: "position")
        translateAnimation.path = movePath.cgPath
        translateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        translateAnimation.isRemovedOnCompletion = true
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform")
        rotateAnimation.fromValue = CATransform3DIdentity
        rotateAnimation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
        rotateAnimation.isCumulative = true
        rotateAnimation.duration = duration/4
        rotateAnimation.repeatCount = 4
        rotateAnimation.isRemovedOnCompletion = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [translateAnimation, rotateAnimation]
        animationGroup.duration = duration
        view.center = end
        return animationGroup
    }
    
    static func reversingAnimateView(view: UIButton, fromPoint start: CGPoint, toPoint end: CGPoint, duration: CFTimeInterval) -> CAAnimationGroup {
        let movePath = UIBezierPath()
        movePath.move(to: start)
        movePath.addLine(to: end)
        
        let translateAnimation = CAKeyframeAnimation(keyPath: "position")
        translateAnimation.path = movePath.cgPath
        translateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        translateAnimation.isRemovedOnCompletion = true
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform")
        rotateAnimation.fromValue = CATransform3DIdentity
        rotateAnimation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
        rotateAnimation.isCumulative = true
        rotateAnimation.duration = duration/3
        rotateAnimation.repeatCount = 3
        rotateAnimation.isRemovedOnCompletion = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [translateAnimation, rotateAnimation]
        animationGroup.duration = duration
        view.center = end
        return animationGroup
    }

}
