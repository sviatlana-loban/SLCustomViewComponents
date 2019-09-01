//
//  PieChartView.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/24/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

import UIKit

public struct SLSegment {
    public let color: UIColor
    public let value: CGFloat
    public let title: String
    
    public var textColor: UIColor {
        return color.isLight ? UIColor.black : UIColor.yellow
    }
    
    public var textSize: CGFloat {
        return 14.0
    }

    public init(color: UIColor, value: CGFloat, title: String) {
        self.color = color
        self.value = value
        self.title = title
    }
}

@IBDesignable
public class SLPieChartView: UIView {
    
    public var segments: [SLSegment] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    let circleLayer = CAShapeLayer()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public func prepareForInterfaceBuilder() {
        setNeedsDisplay()
    }
    
    private func commonInit() {
        isOpaque = false
    }
    
    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
 
        let radius = min(frame.width, frame.height) / 2
        let textPositionOffset: CGFloat = 0.7
        let viewCenter = bounds.center
        
        let totalSegmentsValue = segments.reduce(0, { $0 + $1.value })
        if totalSegmentsValue != 0 {
            var startAngle = -CGFloat.pi / 2
            
            for segment in segments {
                context.setFillColor(segment.color.cgColor)
                
                let endAngle = startAngle + 2 * CGFloat.pi * (segment.value / totalSegmentsValue)
                context.move(to: viewCenter)
                context.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                context.fillPath()
                
                context.move(to: viewCenter)
                context.addLine(to: CGPoint(center: viewCenter, radius: radius, degrees: endAngle))
                context.setStrokeColor(UIColor.black.cgColor)
                context.setLineWidth(3)
                context.strokePath()
                
                let halfAngle = startAngle + (endAngle - startAngle) / 2
                let segmentCenter = viewCenter.projected(by: radius * textPositionOffset, angle: halfAngle)
                let textToRender = segment.title as NSString
                let textAttributes: [NSAttributedString.Key: Any] = [
                    .font               : UIFont.systemFont(ofSize: segment.textSize),
                    .foregroundColor    : segment.textColor
                ]
                let renderRect =  CGRect(centeredOn: segmentCenter, size: textToRender.size(withAttributes: textAttributes))
                textToRender.draw(in: renderRect, withAttributes: textAttributes)
                
                startAngle = endAngle
            }
        }
    }
}
