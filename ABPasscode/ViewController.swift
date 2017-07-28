//
//  ViewController.swift
//  ABPasscode
//
//  Created by Asif Bilal on 26/07/2017.
//  Copyright © 2017 Asif Bilal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var lblPasscode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loadPasscodeViewController(_ sender: UIButton) {
        
        let passcodeVC = PasscodeViewController()
        passcodeVC.delegate = self
        navigationController?.pushViewController(passcodeVC, animated: true)
        
    }
}

extension ViewController: PasscodeViewDelegate {
    
    func passcodeView(_ passcodeView: PasscodeViewController, didEnteredCode code: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            self.navigationController?.popViewController(animated: true)
            self.lblPasscode.text = "Entered Code: \(code)"
        }
        
    }
    
    func passcodeView(_ passcodeView: PasscodeViewController, didTapResendButton resendButton: UIButton) {
        
    }
    
}
