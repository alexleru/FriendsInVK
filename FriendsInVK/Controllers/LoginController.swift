//
//  LoginController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 10/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import WebKit

class LoginController: UIViewController {
    //MARK: - outlets
    @IBOutlet var webView: WKWebView!{
        didSet{
            webView.navigationDelegate = self
        }
    }
    let state = String(Int.random(in: 100000...999999))
    
    //MARK: - ControllerLifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7099973"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.101"),
            URLQueryItem(name: "state", value: state)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
}
extension LoginController: WKNavigationDelegate {
    internal func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String:String]()) {result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"],
            let userIdString = params["user_id"],
            let stateParam = params["state"],
            let userId = Int(userIdString) else {
                decisionHandler(.allow)
                return
        }
        
        Session.instance.token = token
        Session.instance.userId = userId
        
        if(state == stateParam) {
            performSegue(withIdentifier: "LoginSegue", sender: "self")
        }
        //NetworkService().loadGroups()
        //NetworkService().searchGrpups(for: "Ice Cream")
        //NetworkService().loadPhotos()
        
        decisionHandler(.cancel)
    }
}
