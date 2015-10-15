//

//  ViewController.swift

//  task1

//

//  Created by Nikhil Dange on 13/10/15.

//  Copyright © 2015 Nikhil Dange. All rights reserved.

//



import UIKit
import MessageUI

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    var site = String()
    var arr = NSInteger()
    let data = [
        ("Mail us","nil"),
        ("Like us on facebook","https://www.facebook.com/nexchanges"),
        ("Visit our website - Hailyo.com","http://www.oyeok.io")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cellid2")
        let (name,surl) = data[indexPath.row]
        cell!.textLabel?.text = name
        site = surl
        return cell!
        
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        arr = indexPath.row;
        return indexPath
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        arr = indexPath.row;
        if arr == 0
        {
            print("Mail")
            if MFMailComposeViewController.canSendMail(){
                let myController = MFMailComposeViewController()
                myController.mailComposeDelegate = self
                myController.setSubject("App Feedback")
                myController.setMessageBody("Write here..", isHTML: false)
                myController.setToRecipients(["nikdange.me@gmail.com"])
 
                self.presentViewController(myController, animated: true, completion: nil)
            }
            else{
                print("Email Account not found")
                let alert = UIAlertController(title: "Alert", message: "Your Device cannot send emails", preferredStyle: UIAlertControllerStyle.Alert)

                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            
            let ViewC : WebViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("webViewId") as! WebViewController
            
            let (_,site) = data[arr]
            ViewC.url = site
            let nc = UINavigationController(rootViewController: ViewC)
            self.presentViewController(nc, animated: false, completion: nil)
            }
        }
        
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue{
        case MFMailComposeResultSent.rawValue:
            print("Thank You")
        case MFMailComposeResultFailed.rawValue:
            print("Failed")
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Saved")
        default:
            break
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    }
