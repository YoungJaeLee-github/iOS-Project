//
//  ViewController.swift
//  WebBrowserProject
//
//  Created by 이영재 on 2021/08/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    //MARK: - IBOutlets
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Methods
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.webView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let firstPageURL: URL?
        
        if let lastURL: URL = UserDefaults.standard.url(forKey: lastPageURLDefaultKey) {
            firstPageURL = lastURL
        } else {
            firstPageURL = URL(string: "https:www.google.com")
        }
        
        guard let pageURL: URL = firstPageURL else {
            return
        }
        
        let urlRequest: URLRequest = URLRequest(url: pageURL)
        self.webView.load(urlRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - IBActions
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        self.webView.goBack()
    }
    
    @IBAction func goForward(_ sender: UIBarButtonItem) {
        self.webView.goForward()
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        self.webView.reload()
    }
    
    //MARK: Custom Methods
    func showNetworkingIndicators() -> Void {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideNetworkingIndicators() -> Void {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("did finish navigation")
        
        if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.lastPageURL = webView.url
        }
        
        webView.evaluateJavaScript("document.title") { (value: Any?, error: Error?) in
            if let error: Error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let title: String = value as? String else {
                return
            }
            
            self.navigationItem.title = title
        }
        self.hideNetworkingIndicators()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("did fail navigation")
        print("\(error.localizedDescription)")
        
        self.hideNetworkingIndicators()
        
        let message: String = "오류발생!\n" + error.localizedDescription
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okayAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(okayAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("did start navigation")
        self.showNetworkingIndicators()
    }
}
