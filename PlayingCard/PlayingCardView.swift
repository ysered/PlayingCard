//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Yurii Serediuk on 14.10.2019.
//  Copyright © 2019 Yurii Serediuk. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    
    var rank: Int = 5 {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    var suit: String = "♥️" {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    var isFaceUp: Bool = true {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }

    private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        let font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        let scaledFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: scaledFont])
    }
    
    private var cornderString: NSAttributedString {
        return centeredAttributedString("\(rank)\n\(suit)", fontSize: cornerFontSize)
    }
    
    override func draw(_ rect: CGRect) {
//        if let context = UIGraphicsGetCurrentContext() {
//            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
//            context.setLineWidth(5.0)
//            UIColor.red.setStroke()
//            context.strokePath()
//            UIColor.green.setFill()
//            context.fillPath()
//        }
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
//        path.lineWidth = 5.0
//        UIColor.green.setFill()
//        UIColor.red.setStroke()
//        path.stroke()
//        path.fill()
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        UIColor.green.setFill()
        roundedRect.fill()
    }
}

extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    
    private var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
    private var rankString: String {
        switch rank {
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return "?"
        }
    }
}
