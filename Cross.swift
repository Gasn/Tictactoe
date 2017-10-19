//
//  Cross.swift
//  TicTacToe
//
//  Created by Sang Luu on 9/10/17.
//  Copyright © 2017 Sang Luu. All rights reserved.
//

import UIKit

class Cross: UIView {

    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(0.5)
        
        let offset = CGFloat(5)
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: offset, y: offset))
        linePath.addLine(to: CGPoint(x: frame.width - offset, y: frame.height - offset))
        
        linePath.move(to: CGPoint(x: frame.width - offset, y: offset))
        linePath.addLine(to: CGPoint(x: offset, y: frame.height - offset))
            
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.path = linePath.cgPath
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
        shapeLayer.add(animation, forKey: "animateCross")
    }

}
