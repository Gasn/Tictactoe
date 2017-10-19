//
//  Nought.swift
//  TicTacToe
//
//  Created by Sang Luu on 9/10/17.
//  Copyright © 2017 Sang Luu. All rights reserved.
//

import UIKit

class Nought: UIView {
    
    var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(0.5)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2,y: frame.height/2), radius: CGFloat(frame.width - 10) / 2, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.backgroundColor = UIColor.white.cgColor
        //change the fill color
        shapeLayer.fillColor = UIColor.white.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        shapeLayer.strokeEnd = 0
        
        layer.addSublayer(shapeLayer)
        
        animateDrawing(duration: 0.5)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateDrawing(duration: TimeInterval) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = 0
        animation.toValue = 1
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        shapeLayer.strokeEnd = 1.0
        
        // Do the actual animation
        shapeLayer.add(animation, forKey: "animateCircle")
    }
}



