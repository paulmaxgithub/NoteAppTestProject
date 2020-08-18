//
//  DetailVC.swift
//  NoteApp
//
//  Created by Paul Max on 8/14/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var currentNote: NoteModel?
    var indexPath: Int?
    
    @IBOutlet var counterLabel:     UILabel!
    @IBOutlet var titleText:        UITextField!
    @IBOutlet var noteText:         UITextView!
    @IBOutlet var saveBarButton:    UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.delegate = self
        noteText.delegate = self
        
        saveBarButton.isEnabled = false
        
        titleText.resignFirstResponder()
        
        getNoteInfoSetting()
    }
    
    func getNoteInfoSetting() {
        
        if currentNote != nil {
            titleText.text = currentNote?.title
            noteText.text = currentNote?.note
        } else {
            noteText.isEditable = false
            noteText.text = "Create a title before entering a text!"
            noteText.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let notesVC = segue.destination as? NotesVC else { return }
        let newNoteModel = NoteModel(title: titleText.text!, note: noteText.text)
        if currentNote != nil {
            try! realm.write {
                currentNote?.title = newNoteModel.title
                currentNote?.note = newNoteModel.note
            }
        } else {
            StorageManager.saveObject(newNoteModel)
        }
        notesVC.tableView.reloadData()
    }
}
