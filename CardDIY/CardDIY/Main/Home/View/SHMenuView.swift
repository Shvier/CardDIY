//
//  SHMenuView.swift
//  CardDIY
//
//  Created by Shvier on 16/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHMenuView: SHBaseView {
    
    let buttonLength: CGFloat = 35
    let buttonFontSize: CGFloat = 12
    let menuRadius: Double = 150
    let menuButtonCount: NSInteger = 5
    let openAnimationDuration: CFTimeInterval = 0.3
    let closeAnimationDuration: CFTimeInterval = 0.15
    
    private var isOpen: Bool = false

    weak var delegate: SHMenuViewDelegate?
    
    var evaluateButton: UIButton?
    var recommendButton: UIButton?
    var feedbackButton: UIButton?
    var versionButton: UIButton?
    var aboutButton: UIButton?
    var hotSpace: UIView!
    
    var anchorPoint: CGPoint!
    
    @objc func buttonAction(sender: UIButton) {
        if sender.isEqual(evaluateButton) {
            delegate?.menuViewDidEvaluateButtonClicked(self)
        } else if sender.isEqual(recommendButton) {
            delegate?.menuViewDidRecommendButtonClicked(self)
        } else if sender.isEqual(feedbackButton) {
            delegate?.menuViewDidFeedbackButtonClicked(self)
        } else if sender.isEqual(versionButton) {
            delegate?.menuViewDidVersionButtonClicked(self)
        } else if sender.isEqual(aboutButton) {
            delegate?.menuViewDidAboutButtonClicked(self)
        }
    }
    
    @objc func tapAction(tap: UITapGestureRecognizer) {
        delegate?.menuViewShouldDismiss(self)
    }
    
    func ordinate(tangent: Double) -> (x: CGFloat, y: CGFloat) {
        let x = -menuRadius / (sqrt(1 + pow(tangent, 2)))
        let y = x*tangent
        return (CGFloat(x), CGFloat(y))
    }
    
    func ordinateToPoint(ordinate: (x: CGFloat, y: CGFloat)) -> CGPoint {
        return CGPoint(x: ordinate.x, y: ordinate.y)
    }
    
    func createButton(image: UIImage?, title: String?, isEnable: Bool) -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 200, y: 200, width: buttonLength, height: buttonLength)
        if (image != nil) {
            button.setImage(image, for: .normal)
        }
        if (title != nil) {
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
            button.layer.masksToBounds = true
            button.layer.cornerRadius = buttonLength/2
            button.layer.backgroundColor = UIColor(red:0.47, green:0.21, blue:0.98, alpha:1.00).cgColor
        }
        button.isEnabled = isEnable
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }
    
    func initUI() {
        let blurEffect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = self.bounds
        addSubview(effectView)
        
        hotSpace = {
            let view = UIView(frame: self.bounds)
            view.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            view.addGestureRecognizer(tap)
            return view
        }()
        addSubview(hotSpace)
        
        evaluateButton = createButton(image: UIImage(named: "btn_star")!, title: nil, isEnable: true)
        addSubview(evaluateButton!)
        recommendButton = createButton(image: UIImage(named: "btn_recommend")!, title: nil, isEnable: true)
        addSubview(recommendButton!)
        feedbackButton = createButton(image: UIImage(named: "btn_feedback")!, title: nil, isEnable: true)
        addSubview(feedbackButton!)
        versionButton = createButton(image: nil, title: "v" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String), isEnable: false)
        addSubview(versionButton!)
        aboutButton = createButton(image: UIImage(named: "btn_about")!, title: nil, isEnable: true)
        addSubview(aboutButton!)
    }
    
    func toggle() {
        if isOpen {
            dismiss(completion: nil)
            isOpen = false
            isHidden = true
        } else {
            present(completion: nil)
            isOpen = true
            isHidden = false
        }
    }
    
    func present(completion: (() -> Void)?) {
        let tangent0: Double = tan(0)
        let tangent1 = tan(Double.pi/2/Double(menuButtonCount - 1))
        let tangent2 = tan(Double.pi/2/Double(menuButtonCount - 1)*2)
        let tangent3 = tan(Double.pi/2/Double(menuButtonCount - 1)*3)
        let tangent4 = tan(Double.pi/2/Double(menuButtonCount - 1)*4)
        
        let ordinate0 = ordinate(tangent: tangent0)
        let ordinate1 = ordinate(tangent: tangent1)
        let ordinate2 = ordinate(tangent: tangent2)
        let ordinate3 = ordinate(tangent: tangent3)
        let ordinate4 = ordinate(tangent: tangent4)
        
        evaluateButton?.layer.add(SHAnimationGroup.animateView(evaluateButton!, fromPoint: anchorPoint, toPoint: CGPoint(x: anchorPoint.x - ordinate0.x, y: anchorPoint.y), duration: openAnimationDuration), forKey: nil)
        recommendButton?.layer.add(SHAnimationGroup.animateView(recommendButton!, fromPoint: anchorPoint, toPoint: CGPoint(x: anchorPoint.x - ordinate1.x, y: anchorPoint.y - ordinate1.y), duration: openAnimationDuration), forKey: nil)
        feedbackButton?.layer.add(SHAnimationGroup.animateView(feedbackButton!, fromPoint: anchorPoint, toPoint: CGPoint(x: anchorPoint.x - ordinate2.x, y: anchorPoint.y - ordinate2.y), duration: openAnimationDuration), forKey: nil)
        versionButton?.layer.add(SHAnimationGroup.animateView(versionButton!, fromPoint: anchorPoint, toPoint: CGPoint(x: anchorPoint.x - ordinate3.x, y: anchorPoint.y - ordinate3.y), duration: openAnimationDuration), forKey: nil)
        aboutButton?.layer.add(SHAnimationGroup.animateView(aboutButton!, fromPoint: anchorPoint, toPoint: CGPoint(x: anchorPoint.x - ordinate4.x, y: anchorPoint.y - ordinate4.y), duration: openAnimationDuration), forKey: nil)
        
        if (completion != nil) {
            DispatchQueue.main.asyncAfter(deadline: .now() + openAnimationDuration, execute: {
                completion!()
            })
        }
    }
    
    func dismiss(completion: (() -> Void)?) {
        let tangent0: Double = tan(0)
        let tangent1 = tan(Double.pi/2/Double(menuButtonCount - 1))
        let tangent2 = tan(Double.pi/2/Double(menuButtonCount - 1)*2)
        let tangent3 = tan(Double.pi/2/Double(menuButtonCount - 1)*3)
        let tangent4 = tan(Double.pi/2/Double(menuButtonCount - 1)*4)
        
        let ordinate0 = ordinate(tangent: tangent0)
        let ordinate1 = ordinate(tangent: tangent1)
        let ordinate2 = ordinate(tangent: tangent2)
        let ordinate3 = ordinate(tangent: tangent3)
        let ordinate4 = ordinate(tangent: tangent4)
        
        evaluateButton?.layer.add(SHAnimationGroup.reversingAnimateView(view: evaluateButton!, fromPoint: CGPoint(x: anchorPoint.x - ordinate0.x, y: anchorPoint.y), toPoint: anchorPoint, duration: closeAnimationDuration), forKey: nil)
        recommendButton?.layer.add(SHAnimationGroup.reversingAnimateView(view: recommendButton!, fromPoint: CGPoint(x: anchorPoint.x - ordinate1.x, y: anchorPoint.y - ordinate1.y), toPoint: anchorPoint, duration: closeAnimationDuration), forKey: nil)
        feedbackButton?.layer.add(SHAnimationGroup.reversingAnimateView(view: feedbackButton!, fromPoint: CGPoint(x: anchorPoint.x - ordinate2.x, y: anchorPoint.y - ordinate2.y), toPoint: anchorPoint, duration: closeAnimationDuration), forKey: nil)
        versionButton?.layer.add(SHAnimationGroup.reversingAnimateView(view: versionButton!, fromPoint: CGPoint(x: anchorPoint.x - ordinate3.x, y: anchorPoint.y - ordinate3.y), toPoint: anchorPoint, duration: closeAnimationDuration), forKey: nil)
        aboutButton?.layer.add(SHAnimationGroup.reversingAnimateView(view: aboutButton!, fromPoint: CGPoint(x: anchorPoint.x, y: anchorPoint.y - ordinate4.y), toPoint: anchorPoint, duration: closeAnimationDuration), forKey: nil)
        
        if completion != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + closeAnimationDuration, execute: { 
                completion!()
            })
        }
    }
    
    init(frame: CGRect, anchorPoint: CGPoint, delegate: SHMenuViewDelegate) {
        super.init(frame: frame)
        self.anchorPoint = anchorPoint
        self.delegate = delegate
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
