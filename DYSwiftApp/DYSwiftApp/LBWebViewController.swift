//
//  LBWebViewController.swift
//  WalkMoney
//
//  Created by GM on 2020/9/3.
//  Copyright © 2020 GM. All rights reserved.
//

import UIKit
import WebKit

class LBWebViewController: UIViewController {
    
    var url : String = ""
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.webView)
        
        let request = URLRequest.init(url: URL.init(string: self.url)!)
        self.webView.load(request)

        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btn.setTitle("X", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
    @objc func closeAction(){
        self.dismiss(animated: true)
    }
}
