//
//  ViewController.swift
//  snapWebIos
//
//  Created by Muhammad Masykur on 05/07/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textFieldUrl: UITextField!
    
    @IBOutlet weak var payButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.isHidden = true
        textFieldUrl.isHidden = false
        payButton.isHidden = false
        webView.navigationDelegate = self
    }


    @IBAction func openSnap(_ sender: Any) {
        webView.isHidden = false
        textFieldUrl.isHidden = true
        payButton.isHidden = true
        
        guard let urlString = self.textFieldUrl.text else { return}
        guard let url = URL(string: urlString) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        let url = navigationAction.request.url
        return .allow
    }
}

