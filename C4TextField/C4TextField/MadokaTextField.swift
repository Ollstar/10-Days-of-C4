//
//  MatokaTextField.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

/**
 A MadokaTextField is a subclass of the TextFieldEffects object, is a control that displays an UITextField with a customizable visual effect around the edges of the control.
 */
@IBDesignable public class MadokaTextField: TextFieldEffects {
    
    /**
     The color of the placeholder text.
     
     This property applies a color to the complete placeholder string. The default value for this property is a black color.
     */
    @IBInspectable dynamic public var placeholderColor: UIColor = .blackColor() {
        didSet {
            updatePlaceholder()
        }
    }
    
    /**
     The color of the border.
     
     This property applies a color to the lower edge of the control. The default value for this property is a clear color.
     */
    @IBInspectable dynamic public var borderColor: UIColor? {
        didSet {
            updateBorder()
        }
    }
    
    /**
     The scale of the placeholder font.
     
     This property determines the size of the placeholder label relative to the font size of the text field.
     */
    @IBInspectable dynamic public var placeholderFontScale: CGFloat = 0.65 {
        didSet {
            updatePlaceholder()
        }
    }
    
    override public var placeholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            updateBorder()
            updatePlaceholder()
        }
    }
    
    private let borderThickness: Double = 1
    private let placeholderInsets = CGPoint(x: 6, y: 6)
    private let textFieldInsets = Point(6, 6)
    private let borderLayer = ShapeLayer()
    private var backgroundLayerColor: UIColor?
    // MARK: - TextFieldsEffects
    
    override public func drawViewsForRect(rect: Rect) {
        let frame = Rect(Point(), rect.size)
        
        placeholderLabel.frame = CGRectInset(CGRect(frame), placeholderInsets.x, placeholderInsets.y)
        placeholderLabel.font = placeholderFontFromFont(font!)
                
        updateBorder()
        updatePlaceholder()
        layer.addSublayer(borderLayer)
        addSubview(placeholderLabel)
    }
    
    override public func animateViewsForTextEntry() {
        borderLayer.strokeEnd = 1
        
        animateForType(.TextEntry) { 
            let translate = CGAffineTransformMakeTranslation(-self.placeholderInsets.x, self.placeholderLabel.bounds.height + (self.placeholderInsets.y * 2))
            let scale = CGAffineTransformMakeScale(0.9, 0.9)
            
            self.placeholderLabel.transform = CGAffineTransformConcat(translate, scale)
        }
    }
    
    override public func animateViewsForTextDisplay() {
        if text!.isEmpty {
            borderLayer.strokeEnd = percentageForBottomBorder()
            
            animateForType(.TextDisplay) {
                self.placeholderLabel.transform = CGAffineTransformIdentity
            }
        }
    }
    
    // MARK: - Private
    
    private func animateForType(type: AnimationType, withAction action: () -> ()) {
        let a1 = ViewAnimation(duration: 0.3, animations: action)
        a1.addCompletionObserver { 
            self.animationCompletionHandler?(type: type)
        }
        a1.animate()
    }
    
    private func updateBorder() {
        let rect = rectForBorder(Rect(bounds))
        
        let path1 = Path()
        path1.moveToPoint(Point(rect.origin.x + borderThickness, rect.height - borderThickness))
        path1.addLineToPoint(Point(rect.width - borderThickness, rect.height - borderThickness))
        path1.addLineToPoint(Point(rect.width - borderThickness, rect.origin.y + borderThickness))
        path1.addLineToPoint(Point(rect.origin.x + borderThickness, rect.origin.y + borderThickness))
        path1.closeSubpath()

        borderLayer.path = path1.CGPath
        borderLayer.lineCap = kCALineCapSquare
        borderLayer.lineWidth = CGFloat(borderThickness)
        borderLayer.fillColor = nil
        borderLayer.strokeColor = borderColor?.CGColor
        borderLayer.strokeEnd = percentageForBottomBorder()
    }
    
    private func percentageForBottomBorder() -> CGFloat {
        let borderRect = rectForBorder(Rect(bounds))
        let sumOfSides = (borderRect.width * 2) + (borderRect.height * 2)
        return CGFloat((borderRect.width * 100 / sumOfSides) / 100)
    }
    
    private func updatePlaceholder() {
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.sizeToFit()
        layoutPlaceholderInTextRect()
        
        if isFirstResponder() || text!.isNotEmpty {
            animateViewsForTextEntry()
        }
    }
    
    private func placeholderFontFromFont(font: UIFont) -> UIFont! {
        let smallerFont = UIFont(name: font.fontName, size: font.pointSize * placeholderFontScale)
        return smallerFont
    }
    
    private func rectForBorder(bounds: Rect) -> Rect {
        let newRect = Rect(0, 0, bounds.size.width, bounds.size.height - Double(font!.lineHeight) + textFieldInsets.y)
        
        return newRect
    }
    
    private func layoutPlaceholderInTextRect() {
        placeholderLabel.transform = CGAffineTransformIdentity
        
        let textRect = textRectForBounds(bounds)
        var originX = textRect.origin.x
        switch textAlignment {
        case .Center:
            originX += textRect.size.width/2 - placeholderLabel.bounds.width/2
        case .Right:
            originX += textRect.size.width - placeholderLabel.bounds.width
        default:
            break
        }
        
        placeholderLabel.frame = CGRect(x: originX, y: textRect.height - placeholderLabel.bounds.height - placeholderInsets.y,
                                        width: placeholderLabel.bounds.width, height: placeholderLabel.bounds.height)
    }
    
    // MARK: - Overrides
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        let newBounds = rectForBorder(Rect(bounds))
        return CGRectInset(CGRect(newBounds), CGFloat(textFieldInsets.x), 0)
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        let newBounds = rectForBorder(Rect(bounds))
        return CGRectInset(CGRect(newBounds), CGFloat(textFieldInsets.x), 0)
    }
    
}