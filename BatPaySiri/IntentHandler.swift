//
//  IntentHandler.swift
//  BatPaySiri
//
//  Created by Mohonish Chakraborty on 15/04/17.
//  Copyright © 2017 wayne. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        //For Send Payment intents, return appropriate handler.
        if intent is INSendPaymentIntent {
            return SendMoneyIntentHandler()
        }
        return nil
    }
    
}

