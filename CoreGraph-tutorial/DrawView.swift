//
//  DrawView.swift
//  CoreGraph-tutorial
//
//  Created by C4Q on 5/6/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var currentCenter: CGPoint?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        print("A draw function has just been called ")
        guard let currentContext = UIGraphicsGetCurrentContext(),
        let currentCenter = currentCenter
        else {
            print("Could not get the context")
            return
        }
        drawRectangle(using: currentContext, isFilled: true)

    }
 
    
    // TODO: add CGPoint to where it needs to be located
    func drawShape() {
 
        setNeedsDisplay()
    }
    
    private func drawRectangle(using context: CGContext, isFilled: Bool) {
        let strokeDistance: CGFloat = 25
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let lowerLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y + strokeDistance)
        let lowerRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y + strokeDistance)
        let uppperLeftCorner = CGPoint(x: centerPoint.x - strokeDistance, y: centerPoint.y - strokeDistance)
        let upperRightCorner = CGPoint(x: centerPoint.x + strokeDistance, y: centerPoint.y - strokeDistance)
        
        context.move(to: lowerLeftCorner) // let the context starts at this point
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperRightCorner)
        context.addLine(to: uppperLeftCorner)
        context.addLine(to: lowerLeftCorner)
        
        context.setLineCap(.square)
        context.setLineWidth(5.0)
        
        if isFilled {
        context.setFillColor(UIColor.purple.cgColor)
        context.fillPath()
        } else {
        // if not fill
        context.setStrokeColor(UIColor.red.cgColor)
        context.strokePath() // paints a line with the current path
        }
    }
    
    private func drawCircle(using context: CGContext, isFilled: Bool) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        context.addArc(center: centerPoint, radius: 50, startAngle: CGFloat(0), endAngle: CGFloat(360), clockwise: true)
        
        if isFilled {
            context.setFillColor(UIColor.green.cgColor)
            context.fillPath()
        } else {
            // if not fill
            context.setStrokeColor(UIColor.blue.cgColor)
            context.strokePath() // paints a line with the current path
        }
        
    }

}
