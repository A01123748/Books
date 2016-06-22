//
//  ViewController.swift
//  Libros
//
//  Created by Eliseo Fuentes on 6/22/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var results: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isbn.returnKeyType = UIReturnKeyType.Search
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didEnterSearch(sender: AnyObject) {
        var urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        urls = urls+isbn.text!
        let url = NSURL(string: urls)
        let session = NSURLSession.sharedSession()
        let bloque = { (datos:NSData?, resp : NSURLResponse?,error : NSError?)->Void in
            if error?.code != nil {
                dispatch_sync(dispatch_get_main_queue(), {
                    let alertController = UIAlertController(title: "Error", message:
                        error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                })
            } else{
                let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
                dispatch_sync(dispatch_get_main_queue(), {
                    self.results.text = texto! as String
                })
            }
        }
        
        let dt = session.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
    }
}

