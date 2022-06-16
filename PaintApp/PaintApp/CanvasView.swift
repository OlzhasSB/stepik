//
//  CanvasView.swift
//  PaintApp
//
//  Created by Olzhas Seiilkhanov on 15.06.2022.
//

import UIKit

enum DrawMethod {
    case circle
    case rectangle
    case line
    case triangle
    case pencil
}

struct TouchPointAndColor {
    var color: UIColor
    var points: [(CGPoint, CGPoint)]
    var method: DrawMethod
}

class CanvasView: UIView {
    
    var lines = [TouchPointAndColor]()
    var strokeColor: UIColor = .black
    var method: DrawMethod = .pencil
    
    override func draw(_ rect: CGRect) {
        lines.forEach { line in
            line.color.setStroke()
            line.points.forEach { first, last in
                var path = UIBezierPath()
                
                switch method {
                case .pencil: drawLine(first: first, last: last, path: &path)
                case .line: drawLine(first: first, last: last, path: &path)
                case .circle: print("")
                case .triangle: print("")
                case .rectangle: drawRectangle(first: first, last: last, path: &path)
                }
                
                path.lineWidth = 2
                path.stroke()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var first = touches.first?.location(in: nil) else { return }
        first.y -= 100

        lines.append(TouchPointAndColor(color: strokeColor, points: [(first, CGPoint())], method: method))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var touch = touches.first?.location(in: nil) else { return }
        touch.y -= 100
        
        guard var lastPoint = lines.popLast() else { return }
        guard var endPoint = lastPoint.points.popLast() else { return }
        endPoint.1 = touch
        lastPoint.points.append(endPoint)

        if lastPoint.method == .pencil {
            lastPoint.points.append((touch, touch))
        }
        lines.append(lastPoint)
        setNeedsDisplay()
    }
    
    func drawLine(first: CGPoint, last: CGPoint, path: inout UIBezierPath) {
        path.move(to: first)
        path.addLine(to: last)
    }
    
    func drawRectangle(first: CGPoint, last: CGPoint, path: inout UIBezierPath) {
        path.move(to: first)
        path.addLine(to: CGPoint(x: last.x, y: first.y))
        path.addLine(to: last)
        path.addLine(to: CGPoint(x: first.x, y: last.y))
        path.addLine(to: first)
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
