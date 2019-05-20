//
//  ViewController.swift
//  bubble-effect
//
//  Created by JaminZhou on 2017/3/12.
//  Copyright © 2017年 Hangzhou Tomorning Technology Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bearView: FLAnimatedImageView!
    var postaiView: FLAnimatedImageView!
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        addBearView()
        addPostaiView()
        
        addBubbleEffect(bearView)
        addBubbleEffect(postaiView)
    }
    
    func addBubbleEffect(_ view: UIView) {
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.calculationMode = .paced
        pathAnimation.fillMode = .forwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.repeatCount = Float.infinity
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        pathAnimation.duration = 5.0
        
        let width = view.frame.size.width - 3.0
        let curvedPath = CGMutablePath()
        let circleContainer = view.frame.insetBy(dx: width, dy: width)
        curvedPath.addEllipse(in: circleContainer)
        pathAnimation.path = curvedPath
        view.layer.add(pathAnimation, forKey: "circleAnimation")
        
        let scaleX = CAKeyframeAnimation(keyPath: "transform.scale.x")
        scaleX.duration = 6.0
        scaleX.values = [1.0, 1.05, 1.0]
        scaleX.keyTimes = [0.0, 0.5, 1.0]
        scaleX.repeatCount = Float.infinity
        scaleX.autoreverses = true
        scaleX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.layer.add(scaleX, forKey: "scaleXAnimation")
        
        let scaleY = CAKeyframeAnimation(keyPath: "transform.scale.y")
        scaleY.duration = 3.0
        scaleY.values = [1.0, 1.05, 1.0]
        scaleY.keyTimes = [0.0, 0.5, 1.0]
        scaleY.repeatCount = Float.infinity
        scaleY.autoreverses = true
        scaleY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.layer.add(scaleY, forKey: "scaleYAnimation")
    }
    
    func addBearView() {
        let width: CGFloat = 238.0
        bearView = FLAnimatedImageView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: width))
        bearView.center = CGPoint(x: screenWidth/2-33, y: screenHeight/2-60)
        bearView.layer.cornerRadius = width/2
        bearView.layer.masksToBounds = true
        bearView.animatedImage = FLAnimatedImage(animatedGIFData: NSData(contentsOfFile: Bundle.main.path(forResource: "bear", ofType: "gif")!) as Data?)
        view.addSubview(bearView)
    }
    
    func addPostaiView() {
        let width: CGFloat = 140.0
        postaiView = FLAnimatedImageView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: width))
        postaiView.center = CGPoint(x: screenWidth/2+82, y: screenHeight/2+110)
        postaiView.layer.cornerRadius = width/2
        postaiView.layer.masksToBounds = true
        postaiView.animatedImage = FLAnimatedImage(animatedGIFData: NSData(contentsOfFile: Bundle.main.path(forResource: "postai", ofType: "gif")!) as Data?)
        view.addSubview(postaiView)
    }
}

