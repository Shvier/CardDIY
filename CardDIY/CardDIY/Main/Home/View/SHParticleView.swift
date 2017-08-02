//
//  SHParticleView.swift
//  CardDIY
//
//  Created by Shvier on 23/07/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHParticleView: SHBaseView {

    var emitterLayer: CAEmitterLayer!
    
    init(frame: CGRect, movePath: CGPath) {
        super.init(frame: frame)
        initUI()
        configMovePath(path: movePath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initUI() {
        configEmitter()
    }
    
    func configEmitter() {
        emitterLayer = CAEmitterLayer()
        self.layer.addSublayer(emitterLayer)
        emitterLayer.emitterPosition = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        emitterLayer.emitterSize = self.bounds.size
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterMode = kCAEmitterLayerPoints
        emitterLayer.emitterShape = kCAEmitterLayerSphere
        
        let starCell = makeEmitterCell(contents: (UIImage(named: "star")?.cgImage)!)
        starCell.scale = 0.3
        starCell.scaleRange = 0.1
        
        let cycleCell = makeEmitterCell(contents: (UIImage(named: "circle")?.cgImage)!)
        cycleCell.scale = 0.05
        cycleCell.scaleRange = 0.02
        emitterLayer.emitterCells = [starCell, cycleCell]
    }
    
    func makeEmitterCell(contents: CGImage) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 20
        cell.lifetime = 3
        cell.lifetimeRange = 0.3
        cell.contents = contents
        
//        cell.color = UIColor(red:0.71, green:0.33, blue:0.17, alpha:1.00).cgColor
        cell.color = UIColor(red: CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0).cgColor
        cell.velocity = 15
        cell.emissionLongitude = .pi*2
        cell.emissionRange = .pi*2
        cell.velocityRange = 10
        cell.spin = 10
        return cell
    }
    
    func configMovePath(path: CGPath) {
        let animation = CAKeyframeAnimation(keyPath: "emitterPosition")
        animation.path = path
        animation.duration = 8
        animation.repeatCount = MAXFLOAT
        emitterLayer.add(animation, forKey: nil)
    }
    
}
