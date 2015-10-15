//
//  WebViewController.swift
//  task1
//
//  Created by Nikhil Dange on 13/10/15.
//  Copyright © 2015 Nikhil Dange. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UINavigationBarDelegate {

    
    @IBOutlet weak var webView: UIWebView!
        var url = String()
    @IBOutlet weak var webBack: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("URL : \(url)")
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
 
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    
    @IBAction func BackBtnAction(sender: UIBarButtonItem) {
      self.dismissViewControllerAnimated(true, completion: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
