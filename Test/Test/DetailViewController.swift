//
//  DetailViewController.swift
//  Test
//
//  Created by Eliseo Fuentes on 7/17/16.
//  Copyright © 2016 Eliseo Fuentes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var results: UITextView!
    @IBOutlet weak var portada: UIImageView!



    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.isbn {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButton(sender: AnyObject) {
    print("testing")
    }

    @IBAction func search(sender: AnyObject) {
        print("testing")
    }
}

