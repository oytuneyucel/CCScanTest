//
//  ViewController.swift
//  CCTest
//
//  Created by Oytun Yücel on 2/22/21.
//

import UIKit
import CardScan

class ViewController: UIViewController, ScanDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    // It's important that this goes in viewWillAppear because the user may deny permission
    // on the ScanViewController, in which case you'd want to hide the button to avoid
    // future presses
        if !ScanViewController.isCompatible() {
        // Hide your "scan card" button because this device isn't compatible with CardScan
        }
    }
    
    @IBAction func scanCardButtonPressed() {
        guard let vc = ScanViewController.createViewController(withDelegate: self) else {
        print("This device is incompatible with CardScan")
        return
    }

        self.present(vc, animated: true)
    }

    func userDidSkip(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidCancel(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        
            let dictParams: NSMutableDictionary? = ["test" : "test",
                "ccNo" : creditCard.number, // Always use optional values carefully!
                "month" : creditCard.expiryMonth ?? "",
                "year" : creditCard.expiryYear ?? "",
                "cvv" : creditCard.name ?? ""
            ]
            
            print("dict %@" , dictParams);

    // At this point you have the credit card number and optionally the expiry.
    // You can either tokenize the number or prompt the user for more
    // information (e.g., CVV) before tokenizing.

        self.dismiss(animated: true)
    }

}


class ScannerViewController: UIViewController, ScanDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    // It's important that this goes in viewWillAppear because the user may deny permission
    // on the ScanViewController, in which case you'd want to hide the button to avoid
    // future presses
        if !ScanViewController.isCompatible() {
        // Hide your "scan card" button because this device isn't compatible with CardScan
        }
    }
    
    @IBAction func scanCardButtonPressed() {
        guard let vc = ScanViewController.createViewController(withDelegate: self) else {
        print("This device is incompatible with CardScan")
        return
    }

        self.present(vc, animated: true)
    }

    func userDidSkip(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidCancel(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        
            let dictParams: NSMutableDictionary? = ["test" : "test",
                "ccNo" : creditCard.number, // Always use optional values carefully!
                "month" : creditCard.expiryMonth ?? "",
                "year" : creditCard.expiryYear ?? "",
                "cvv" : creditCard.name ?? ""
            ]
            
            print("dict %@" , dictParams);

    // At this point you have the credit card number and optionally the expiry.
    // You can either tokenize the number or prompt the user for more
    // information (e.g., CVV) before tokenizing.

        self.dismiss(animated: true)
    }
}
