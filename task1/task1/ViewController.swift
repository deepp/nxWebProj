//
//  ViewController.swift
//  task1
//
//  Created by Nikhil Dange on 13/10/15.
//  Copyright © 2015 Nikhil Dange. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{

    var site = String()
    var arr = NSInteger()
    
    let data = [
        ("Rate us on App store","https://apple.com"),
        ("Like us on facebook","https://www.facebook.com/nexchanges"),
        ("Visit our website - Hailyo.com","http://www.oyeok.io")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(data)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cellid")
        let (storename,s) = data[indexPath.row]
        cell!.textLabel?.text = storename
        site = s
        return cell!
    }
//    func getarr() -> NSInteger{

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")

        arr = indexPath.row;
        
        print("\(arr)")
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print("You selected cell #\(indexPath.row)!")
        
        arr = indexPath.row;
        
        print("\(arr)")
        
        return indexPath
    }
        
    //    return arr
    //}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "webSegue"){
            let detailobj = segue.destinationViewController as! WebViewController
            
            let (_,site) = data[arr]
            detailobj.url = site;

        }
    }
}

