//
//  CanvasView.swift
//  PaintApp
//
//  Created by Olzhas Seiilkhanov on 15.06.2022.
//

import UIKit

struct TouchPointAndColor {
    var color: UIColor?
//    var width: CGFloat?
//    var opacity: CGFloat?
    var points: [CGPoint]?
    
    init(color: UIColor, points: [CGPoint]) {
        self.color = color
        self.points = points
    }
}

class CanvasView: UIView {
    
    var lines = [TouchPointAndColor]()
    var strokeColor: UIColor = .black
    var method: String = "pen"
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if method == "pen" {
            setNeedsDisplay()
            guard let context = UIGraphicsGetCurrentContext() else { return }
            lines.forEach { (line) in
                for (i,p) in (line.points?.enumerated())! {
                    if i == 0 {
                        context.move(to: p)
                    } else {
                        context.addLine(to: p)
                    }
                    context.setStrokeColor(line.color?.withAlphaComponent(1.0).cgColor ?? UIColor.black.cgColor)
                    context.setLineWidth(1.0)
                }
                context.setLineCap(.round)
                context.strokePath()
            }
        } else if method == "line" {
            setNeedsDisplay()
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setLineWidth(1.0)
            context.setStrokeColor(UIColor.black.cgColor)
            context.move(to: CGPoint(x: 40, y: 40))
            context.addLine(to: CGPoint(x: 500, y: 300))
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(TouchPointAndColor(color: UIColor(), points: [CGPoint]()))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: nil) else { return }
        
        guard var lastPoint = lines.popLast() else { return }
        lastPoint.points?.append(touch)
        lastPoint.color = strokeColor
        lines.append(lastPoint)
        setNeedsDisplay()
    }
    
    
    
    func clearCanvasView() {
        lines.removeAll()
        setNeedsDisplay()
    }
    func undoDraw() {
        if lines.count > 0 {
            lines.removeLast()
            setNeedsDisplay()
        }
    }
}
