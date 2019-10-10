//
//  DHWebViewController.swift
//  HoonLib
//
//  Created by enliple on 17/09/2019.
//

import UIKit
import WebKit

class DHWebViewController: UIViewController {

    deinit {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: "DHWebViewController", bundle: Bundle(for: DHWebViewController.self))
    }
    
    @objc convenience public init(url:String) {
        self.init()
    }
    
    var loadUrl:String = ""
    
    @IBOutlet fileprivate weak var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL.init(string: loadUrl) {
            wkWebView.load(URLRequest.init(url: url))
        }
    }

    
    @IBAction func clickedBackButton(_ sender: Any) {
        self.hlDismiss()
    }
    
}
