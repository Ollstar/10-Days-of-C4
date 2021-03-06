//
//  TextFieldEffects.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

extension String {
    /**
     true iff self contains characters.
     */
    public var isNotEmpty: Bool {
        return !isEmpty
    }
}

/**
 A TextFieldEffects object is a control that displays editable text and contains the boilerplates to setup unique animations for text entrey and display. You typically use this class the same way you use UITextField.
 */
public class TextFieldEffects : UITextField {
    
    /**
     The type of animatino a TextFieldEffect can perform.
     
     - TextEntry: animation that takes effect when the textfield has focus.
     - TextDisplay: animation that takes effect when the textfield loses focus.
     */
    public enum AnimationType: Int {
        case TextEntry
        case TextDisplay
    }
    
    /**
     Closure executed when an animation has been completed.
     */
    public typealias AnimationCompletionHandler = (type: AnimationType)->()
    
    /**
     UILabel that holds all the placeholder information
     */
    public let placeholderLabel = UILabel()
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */
    public func animateViewsForTextEntry() {
        fatalError("\(#function) must be overridden")
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "display input text" state.
     */
    public func animateViewsForTextDisplay() {
        fatalError("\(#function) must be overridden")
    }
    
    /**
     The animation completion handler is the best place to be notified when the text field animation has ended.
     */
    public var animationCompletionHandler: AnimationCompletionHandler?
    
    /**
     Draws the receiver’s image within the passed-in rectangle.
     
     - parameter rect:	The portion of the view’s bounds that needs to be updated.
     */
    public func drawViewsForRect(rect: Rect) {
        fatalError("\(#function) must be overridden")
    }
    
    public func updateViewsForBoundsChange(bounds: Rect) {
        fatalError("\(#function) must be overridden")
    }
    
    // MARK: - Overrides
    
    override public func drawRect(rect: CGRect) {
        drawViewsForRect(Rect(rect))
    }
    
    override public func drawPlaceholderInRect(rect: CGRect) {
        // Don't draw any placeholders
    }
    
    override public var text: String? {
        didSet {
            if let text = text where text.isNotEmpty {
                animateViewsForTextEntry()
            } else {
                animateViewsForTextDisplay()
            }
        }
    }
    
    // MARK: - UITextField Observing
    
    override public func willMoveToSuperview(newSuperview: UIView!) {
        if newSuperview != nil {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textFieldDidEndEditing), name: UITextFieldTextDidEndEditingNotification, object: self)
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textFieldDidBeginEditing), name: UITextFieldTextDidBeginEditingNotification, object: self)
        } else {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }
    
    /**
     The textfield has started an editing session.
     */
    public func textFieldDidBeginEditing() {
        animateViewsForTextEntry()
    }
    
    /**
     The textfield has ended an editing session.
     */
    public func textFieldDidEndEditing() {
        animateViewsForTextDisplay()
    }
    
    // MARK: - Interface Builder
    
    override public func prepareForInterfaceBuilder() {
        drawViewsForRect(Rect(frame))
    }
}
