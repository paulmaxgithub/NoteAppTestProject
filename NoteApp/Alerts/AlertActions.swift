//
//  AlertActions.swift
//  NoteApp
//
//  Created by Paul Max on 8/15/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit

extension DetailVC {
    
    func charLimitExceededInTextView () {
        let alert = UIAlertController(
            title: "Character Limit Exceeded!",
            message: "Count of entered text must equal not over 1000 symbols including the space.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func charLimitExceededInTextField () {
        let alert = UIAlertController(
            title: "Character Limit Exceeded!",
            message: "Count of entered text must equal not over 250 symbols including the space.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
