//
//  PasscodeViewController.swift
//  PasscodeViewController
//
//  Created by Asif Bilal on 26/07/2017.
//  Copyright © 2017 Asif Bilal. All rights reserved.
//

import UIKit

@objc protocol PasscodeViewDelegate: class {
    func passcodeView(_ passcodeView:PasscodeViewController, didEnteredCode code: String)
    func passcodeView(_ passcodeView:PasscodeViewController, didTapResendButton resendButton:UIButton)
    @objc optional func passcodeView(_ passcodeView:PasscodeViewController, didTapNextButton nextButton:UIButton)
}

class PasscodeViewController: UIViewController {
    
    // MARK: - class properties
    let passcodeFieldBaseTag = 100
    
    weak var delegate: PasscodeViewDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var passcodeView: UIView!
    @IBOutlet fileprivate weak var dummyTextField: UITextField!
    
    // MARK: - life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewConfigurations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func editingChanged(_ sender: UITextField) {
        
        var currentTextLength = 0
        if let textFieldText = sender.text {
            currentTextLength = textFieldText.length
        }
        
        for i in 0 ..< currentTextLength {
            let textField = passcodeView.viewWithTag(passcodeFieldBaseTag + i) as! UITextField
            
            let startIndex = sender.text!.characters.index(sender.text!.startIndex, offsetBy: i)
            let endIndex = sender.text!.characters.index(sender.text!.startIndex, offsetBy: i+1)
            let range = startIndex..<endIndex
            textField.text = sender.text?.substring(with: range)
        }
        
        for i in sender.text!.length ..< 4 {
            let textField = passcodeView.viewWithTag(passcodeFieldBaseTag + i) as! UITextField
            textField.text = ""
        }
        
        let code = sender.text
        if code?.length == 4 {
            delegate?.passcodeView(self, didEnteredCode: code!)
        }
        
        
    }
    
    @IBAction func resendCodeTouchUpInside(_ sender: AnyObject) {
        
    }
    
    @IBAction func nextTouchUpInside(_ sender: AnyObject) {
    }
    
    // MARK: - private functions
    
    fileprivate func viewConfigurations() {
        
        edgesForExtendedLayout = []
        dummyTextField.becomeFirstResponder()
    }
    
    fileprivate func resetPassCodeFields() {
        
        dummyTextField.text = ""
        for i in  0 ..< 4 {
            let textField = passcodeView.viewWithTag(passcodeFieldBaseTag + i) as! UITextField
            textField.text = ""
        }
        
    }
    
}

extension PasscodeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var oldLength = 0
        
        if let textFieldText = textField.text {
            oldLength = textFieldText.length
        }
        
        let replacementLength = string.length
        let rangeLength = range.length
        let newLength = oldLength - rangeLength + replacementLength
        let returnKey = string.range(of: "\n") != nil
        return newLength <= 4 || returnKey
        
    }


}
