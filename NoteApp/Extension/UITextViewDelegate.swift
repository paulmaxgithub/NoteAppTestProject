//
//  UITextViewDelegate.swift
//  NoteApp
//
//  Created by Paul Max on 8/14/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit

extension DetailVC: UITextViewDelegate {
    
    // to count number of entered symbols
    func textViewDidChange(_ textView: UITextView) {
        
        let maxCharCount = 1000
        let remainingCharCount = -textView.text.count
        let currentCharCount = maxCharCount + remainingCharCount
        counterLabel.text = String(currentCharCount)
        
        if currentCharCount <= 0 {
            charLimitExceededInTextView()
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textView(
        _ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n") {
            textView.resignFirstResponder()
            self.saveBarButton.isEnabled = true
            return false
        }
        return true
    }
}
