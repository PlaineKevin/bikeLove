//
//  DetailViewController.swift
//  BikeLove
//
//  Created by Kevin Nguyen on 6/27/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit
import Moltin

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

 
    @IBOutlet weak var productTitle: UILabel!

    @IBOutlet weak var price: UILabel!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    @IBAction func addToCart(sender: AnyObject) {
        // Get the current product's ID string from the detailItem product info dictionary...
        let productId: String = self.detailItem?.valueForKey("id") as! String
        
        Moltin.sharedInstance().cart.insertItemWithId(productId, quantity: 1, andModifiersOrNil: nil, success: { (response) -> Void in
            // Added to cart!
            // We'll show a UIAlertController to tell the user what we've done...
            let alert = UIAlertController(title: "Added to cart!", message: "Added item to cart!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            }, failure: { (response, error) -> Void in
                print("Something went wrong! \(error)")
        })
    }
    
    func configureView() {
        // Set the item title from the detailItem dictionary's 'title' key
        if let title = detailItem!.valueForKey("title") as? String {
            productTitle?.text = title
            self.title = productTitle?.text
        }
        
        // Set the formatted price with tax by looking at the key path in the detailItem dictionary
        if let price = detailItem!.valueForKeyPath("price.data.formatted.with_tax") as? String {
            self.price?.text = price
        }
        
        // Set the item description from the detailItem dictionary's 'description' key
        if let description = detailItem!.valueForKey("description") as? String {
            detailDescriptionLabel?.text = description
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


}

