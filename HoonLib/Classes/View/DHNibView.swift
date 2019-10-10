//
//  DHNibView.swift
//  Pods
//
//  Created by showthat on 26/09/2019.
//

import UIKit

@IBDesignable
public class DHNibView: UIView {
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setup view from .xib file
        xibSetup()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        xibSetup()
        view.prepareForInterfaceBuilder()
    }
    
    func loadNib() -> UIView {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}

private extension DHNibView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()

        // use bounds not frame or it'll be offset
        view.frame = bounds

        // Adding custom subview on top of our view
        addSubview(view)
    }
    
}
