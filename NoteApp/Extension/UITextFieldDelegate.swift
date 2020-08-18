//
//  UITextFieldDelegate.swift
//  NoteApp
//
//  Created by Paul Max on 8/14/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit

extension DetailVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if titleText.text!.isEmpty {
            //showAlert()
            return false
        } else {
            noteText.isEditable = true
            self.noteText.becomeFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let maxLenght = 250
        let currentString = textField.text! as NSString
        let newString = currentString.replacingCharacters(in: range, with: string) as NSString
        counterLabel.text = String(newString.length)
        if newString.length > maxLenght {
            counterLabel.text = String(maxLenght)
            charLimitExceededInTextField()
        }
        
        return newString.length <= maxLenght
    }
}
