//
//  DHChatBotButton.swift
//
//  Created by enliple on 26/09/2019.
//

import UIKit

@IBDesignable
public class DHChatBotButton: UIView {
    
    @IBInspectable public var showingUrl:String = ""
    
    
    var floatButtonView: UIImageView = UIImageView.init(frame: .zero)
    var subMessageView: UIView = UIView.init(frame: .zero)
    var messageLabel: UILabel = UILabel.init(frame: .zero)
    
    var isAnimated:Bool = false
    var maximumWidth:CGFloat = 200.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
        
        self.floatButtonView.prepareForInterfaceBuilder()
        self.subMessageView.prepareForInterfaceBuilder()
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
//        if !isAnimated {
//            isAnimated = true
//            
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
//                self.showSubMessageView()
//            }
//        }
        
    }
    
    
    public override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
    }
    
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.addSubview(subMessageView)
        self.addSubview(floatButtonView)
        
        subMessageView.frame = self.bounds
        subMessageView.backgroundColor = UIColor.init(r: 114, g: 71, b: 199)
        subMessageView.layer.masksToBounds = true
        subMessageView.layer.cornerRadius = self.bounds.height / 2.0
        
        floatButtonView.frame = self.bounds
        floatButtonView.backgroundColor = UIColor.init(r: 121, g: 98, b: 162)
        floatButtonView.layer.masksToBounds = true
        floatButtonView.layer.cornerRadius = self.bounds.height / 2.0
//        floatButtonView.layer.borderColor = UIColor.init(r: 111, g: 88, b: 182).cgColor
        floatButtonView.layer.borderColor = UIColor.white.cgColor
        floatButtonView.layer.borderWidth = 1.0
        
        floatButtonView.isUserInteractionEnabled = true
        floatButtonView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(excuteTapGesture(gesture:))))
        
        
        subMessageView.addSubview(messageLabel)
        messageLabel.frame = CGRect.init(x: 5, y: 0, width: maximumWidth - (self.bounds.width + 10), height: self.bounds.height)
        messageLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        messageLabel.textColor = .white
        messageLabel.text = "아이봇 샘플 메세지 입니다."
    }
    
    
    @objc func excuteTapGesture(gesture:UITapGestureRecognizer) {

        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            if rootViewController is UINavigationController {
                DHViewControllerPresenter.shared.showWebViewController(parent: rootViewController, url: showingUrl, isPush: true)
            }
            else {
                DHViewControllerPresenter.shared.showWebViewController(parent: rootViewController, url: showingUrl)
            }
        }
    }
    
    
    public func showSubMessageView() {
        subMessageView.alpha = 0.0
        subMessageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)

        UIView.animate(withDuration: 1.0, delay: 0.0, animations: { 
            self.subMessageView.alpha = 1.0
            self.subMessageView.frame = CGRect.init(x: (self.frame.width-self.maximumWidth), y: 0, width: self.maximumWidth, height: self.frame.height)
            self.setNeedsDisplay()
        }) { (finish) in
             if finish {
                Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (t2) in
                    self.hideSubMessageView()
                }
            }
        }
        
    }
    
    public func hideSubMessageView() {
        subMessageView.alpha = 1.0
        subMessageView.frame = CGRect.init(x: (self.frame.width-maximumWidth), y: 0, width: maximumWidth, height: self.frame.height)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            self.subMessageView.alpha = 0.0
            self.subMessageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        }) { (finish) in
        }
    }
    
}
