//
//  ViewController.swift
//  BatPay
//
//  Created by Mohonish Chakraborty on 15/04/17.
//  Copyright © 2017 wayne. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestForSiriPermission()
        //registerCustomVocabulary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Trigger Siri authorization request.
    func requestForSiriPermission() {
        
        INPreferences.requestSiriAuthorization({ status in
            switch status {
            case .authorized:
                print("Siri Permission Authorized")
            default:
                print("Needs Siri Permission")
            }
        })
        
    }
    
    //Register Custom Vocabulary
    func registerCustomVocabulary() {
        
        let names = NSOrderedSet(array: [
            "Wayne Enterprises",
            "The Joker",
            "My Butler"
        ])
        
        let vocabulary = INVocabulary.shared()
        vocabulary.setVocabularyStrings(names, of: .paymentsAccountNickname)
        
    }
    
}

