//
//  IntentViewController.swift
//  BatPaySiriUI
//
//  Created by Mohonish Chakraborty on 15/04/17.
//  Copyright © 2017 wayne. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

class IntentViewController: UIViewController, INUIHostedViewControlling, INUIHostedViewSiriProviding {
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var recipientImageView: UIImageView!
    
    @IBOutlet weak var recipientLabel: UILabel!
    
    @IBOutlet weak var footerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        if let paymentIntent = interaction.intent as? INSendPaymentIntent {
            
            //Show amount with currency code.
            if let amount = paymentIntent.currencyAmount?.amount,
                let currencyCode = paymentIntent.currencyAmount?.currencyCode {
                self.topLabel.text = "Pay \(currencyCode) \(amount)"
            }
            
            //Show recipient details
            if let payee = paymentIntent.payee {
                self.recipientLabel.text = payee.displayName
            }
            
            //Show payment note
            if let note = paymentIntent.note {
                self.footerLabel.text = note
            }
        }
        
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
    //Part of INUIHostedViewSiriProviding protocol to inform Siri that the extension takes UI responsibility.
    var displaysPaymentTransaction: Bool {
        return true
    }
    
}
