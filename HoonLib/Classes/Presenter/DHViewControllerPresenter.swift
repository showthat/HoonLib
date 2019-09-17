//
//  DHViewControllerPresenter.swift
//  HoonLib
//
//  Created by enliple on 17/09/2019.
//

import Foundation


public class DHViewControllerPresenter {
    public static let shared: DHViewControllerPresenter = DHViewControllerPresenter()
    
    public func showWebViewController(parent:UIViewController, url:String, isPush:Bool = false, animated:Bool = true) {
        
        let vc = DHWebViewController.init(nibName: "DHWebViewController", bundle: Bundle.main)
        
        if isPush && parent.navigationController != nil {
            parent.navigationController?.pushViewController(vc, animated: animated)
        }
        else {
            parent.present(vc, animated: animated, completion: nil)
        }
    } 
}
