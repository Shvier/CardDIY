//
//  SHWhirlpoolView.swift
//  CardDIY
//
//  Created by Shvier on 03/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHWhirlpoolView: SHBaseView {
    
    let centerX = UIScreen.main.bounds.size.width/2
    let centerY = UIScreen.main.bounds.size.height/2
    let widthPerUnit: CGFloat = UIScreen.main.bounds.size.width/20
    let heightPerUnit: CGFloat = UIScreen.main.bounds.size.height/35
    
    lazy var particleViews: [SHParticleView] = {
        return Array<SHParticleView>()
    }()
    
    lazy var bezierPaths: [CGPath] = {
        return Array<CGPath>()
    }()
    
    func createBezierPath(startPoint: CGPoint, endPoint: CGPoint, controlPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.lineWidth = 5.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        return path
    }

    func setupParticleView() {
        for _ in 0..<10 {
            let particleView = SHParticleView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
            self.addSubview(particleView)
            particleViews.append(particleView)
        }
    }
    
    func setupBezierPath() {
        // Left Top to Center
        let ltcPath = createBezierPath(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: ScreenWidth/2, y: ScreenHeight/2), controlPoint: CGPoint(x: ScreenWidth/20*14, y: ScreenHeight/35*5))
        bezierPaths.append(ltcPath.cgPath)
        // Center to Right Bottom
        let crbPath = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*6, y: heightPerUnit*30))
        bezierPaths.append(crbPath.cgPath)
        // Right Top to Center
        let rtcPath = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: 0), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*19, y: heightPerUnit*10))
        bezierPaths.append(rtcPath.cgPath)
        // Center to Left Bottom
        let clbPath = createBezierPath(startPoint: CGPoint(x: 0, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*1, y: heightPerUnit*25))
        bezierPaths.append(clbPath.cgPath)
        // 2 Left to Center
        let tltcPath = createBezierPath(startPoint: CGPoint(x: 0, y: heightPerUnit*10), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*10))
        bezierPaths.append(tltcPath.cgPath)
        // Center to 2 Right
        let cttrPath = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: heightPerUnit*25), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*25))
        bezierPaths.append(cttrPath.cgPath)
        // 3 Left to Center
        let threeltcPath = createBezierPath(startPoint: CGPoint(x: 0, y: heightPerUnit*20), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*5, y: heightPerUnit*17))
        bezierPaths.append(threeltcPath.cgPath)
        // Center to 3 Left
        let cthreelPath = createBezierPath(startPoint: CGPoint(x: ScreenWidth, y: heightPerUnit*15), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*15, y: heightPerUnit*18))
        bezierPaths.append(cthreelPath.cgPath)
        // 2 Top to Center
        let ttcPath = createBezierPath(startPoint: CGPoint(x: widthPerUnit*13, y: 0), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*13, y: heightPerUnit*9))
        bezierPaths.append(ttcPath.cgPath)
        // Center to 2 Bottom
        let ctbPath = createBezierPath(startPoint: CGPoint(x: widthPerUnit*7, y: ScreenHeight), endPoint: CGPoint(x: centerX, y: centerY), controlPoint: CGPoint(x: widthPerUnit*7, y: heightPerUnit*26))
        bezierPaths.append(ctbPath.cgPath)
    }
    
    func startAnimation() {
        for index in 0..<particleViews.count {
            repeat {
                let particleView = particleViews[index]
                particleView.configMovePath(path: bezierPaths[index])
            } while(false)
        }
    }
    
    func initUI() {
        setupParticleView()
        setupBezierPath()
        startAnimation()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
