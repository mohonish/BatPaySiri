//
//  SendMoneyIntentHandler.swift
//  BatPay
//
//  Created by Mohonish Chakraborty on 15/04/17.
//  Copyright © 2017 wayne. All rights reserved.
//

import Foundation
import Intents
//TODO: import BatPayFramework

class SendMoneyIntentHandler: NSObject, INSendPaymentIntentHandling {
    
    // MARK: - Handle
    
    func handle(sendPayment: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
    
    // MARK: - Confirm
    
    func confirm(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
    
        //1. Check for validity of all required data in sendPayment intent.
        //2. Call completion block with appropriate (success) response.
        
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    
    }
    
    // MARK: - Resolve Payee
    
    func resolvePayee(forSendPayment: INSendPaymentIntent, with: @escaping (INPersonResolutionResult) -> Void) {
        
        //with(INPersonResolutionResult.confirmationRequired(with: INPerson))
        //with(INPersonResolutionResult.disambiguation(with: [INPerson]))
        
        if let payee = forSendPayment.payee {
            with(INPersonResolutionResult.success(with: payee))
        }
    }
    
    // MARK: - Resolve Currency
    
    func resolveCurrencyAmount(forSendPayment: INSendPaymentIntent, with: @escaping (INCurrencyAmountResolutionResult) -> Void) {
        
        //with(INCurrencyAmountResolutionResult.confirmationRequired(with: INCurrencyAmount?))
        //with(INCurrencyAmountResolutionResult.disambiguation(with: [INCurrencyAmount])
        
        if let currency = forSendPayment.currencyAmount {
            with(INCurrencyAmountResolutionResult.success(with: currency))
        }
    }
    
    // MARK: - Resolve Note
    
    func resolveNote(forSendPayment: INSendPaymentIntent, with: @escaping (INStringResolutionResult) -> Void) {
        
        //with(INStringResolutionResult.confirmationRequired(with: String?))
        //with(INStringResolutionResult.disambiguation(with: [String])
        
        if let note = forSendPayment.note {
            with(INStringResolutionResult.success(with: note))
        } else {
            with(INStringResolutionResult.success(with: ""))
        }
        
    }
    
}
