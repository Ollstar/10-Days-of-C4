//
//  KaedeTextField.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-27.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

/**
 A KaedeTextField is a subclass of the TextFieldEffects object, is a control that displays an UITextField with a customizable visual effect around the foreground of the control.
 */
@IBDesignable public class KaedeTextField: TextFieldEffects {
    
    /**
     The color of the placeholder text.
     
     This property applies a color to the complete placeholder string. The default value for this property is a black color.
     */
    @IBInspectable dynamic public var placeholderColor: UIColor? {
        didSet {
            updatePlaceholder()
        }
    }
    
    /**
     The scale of the placeholder font.
     
     This property determines the size of the placeholder label relative to the font size of the text field.
     */
    @IBInspectable dynamic public var placeholderFontScale: CGFloat = 0.8 {
        didSet {
            updatePlaceholder()
        }
    }
    
    /**
     The view’s foreground color.
     
     The default value for this property is a clear color.
     */
    @IBInspectable dynamic public var foregroundColor: UIColor? {
        didSet {
            updateForegroundColor()
        }
    }
    
    override public var placeholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            drawViewsForRect(Rect(bounds))
        }
    }
    
    private let foregroundView = UIView()
    private let placeholderInsets = CGPoint(x: 10, y: 5)
    private let textFieldInsets = CGPoint(x: 10, y: 0)
    private var spring = Spring(damping: 0.8, initialVelocity: 2.0)
    // MARK: - TextFieldsEffects
    
    override public func drawViewsForRect(rect: Rect) {
        let frame = CGRect(origin: CGPointZero, size: CGSize(width: rect.size.width, height: rect.size.height))
        
        foregroundView.frame = frame
        foregroundView.userInteractionEnabled = false
        placeholderLabel.frame = CGRectInset(frame, placeholderInsets.x, placeholderInsets.y)
        placeholderLabel.font = placeholderFontFromFont(font!)
        
        updateForegroundColor()
        updatePlaceholder()
        
        if text!.isNotEmpty || isFirstResponder() {
            animateViewsForTextEntry()
        }
        
        addSubview(foregroundView)
        addSubview(placeholderLabel)
    }
    
    override public func animateViewsForTextEntry() {
        let a1 = ViewAnimation(duration: 0.35) {
            self.placeholderLabel.frame.origin = CGPoint(x: self.frame.size.width * 0.65, y: self.placeholderInsets.y)
        }
        a1.spring = spring
        a1.animate()
        let a2 = ViewAnimation(duration: 0.45) {
            self.foregroundView.frame.origin = CGPoint(x: self.frame.size.width * 0.6, y: 0)
        }
        spring.initialVelocity = 1.5; a2.spring = spring
        a2.animate()
        a2.addCompletionObserver { 
            self.animationCompletionHandler?(type: .TextEntry)
        }
    }
    
    override public func animateViewsForTextDisplay() {
        if text!.isEmpty {
            let a1 = ViewAnimation(duration: 0.3) {
                self.placeholderLabel.frame.origin = self.placeholderInsets
            }
            spring.initialVelocity = 2.0; a1.spring = spring
            a1.animate()
            let a2 = ViewAnimation(duration: 0.3) {
                self.foregroundView.frame.origin = CGPointZero
            }
            spring.damping = 1.0; a2.spring = spring
            a2.animate()
            a2.addCompletionObserver({ 
                self.animationCompletionHandler?(type: .TextDisplay)
            })
        }
    }
    
    // MARK: - Private
    
    private func updateForegroundColor() {
        foregroundView.backgroundColor = foregroundColor
    }
    
    private func updatePlaceholder() {
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
    }
    
    private func placeholderFontFromFont(font: UIFont) -> UIFont! {
        let smallerFont = UIFont(name: font.fontName, size: font.pointSize * placeholderFontScale)
        return smallerFont
    }
    
    // MARK: - Overrides
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        let frame = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width * 0.6, height: bounds.size.height))
        
        return CGRectInset(frame, textFieldInsets.x, textFieldInsets.y)
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        let frame = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width * 0.6, height: bounds.size.height))
        
        return CGRectInset(frame, textFieldInsets.x, textFieldInsets.y)
    }
    
}