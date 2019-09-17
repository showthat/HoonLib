//
//  DHViewControllerPresenter.swift
//  HoonLib
//
//  Created by enliple on 17/09/2019.
//

import Foundation


public class DHViewControllerPresenter {
    public static let shared: DHViewControllerPresenter = DHViewControllerPresenter()
    
    public func showWebViewController(parent:UIViewController, url:String, isPush:Bool = false, animated:Bool = true, completion: (() -> Void)? = nil) {
        
        let vc = DHWebViewController.init(nibName: "DHWebViewController", bundle: Bundle.main)
        
        parent.hlPresent(vc: vc, isPush: isPush, animated: animated, completion: completion)
    }
}
