//
//  NotesVC.swift
//  NoteApp
//
//  Created by Paul Max on 8/14/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import UIKit
import RealmSwift

class NotesVC: UITableViewController {
    
    var notes: Results<NoteModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = realm.objects(NoteModel.self)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.isEmpty ? 0 : notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].note
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = notes[indexPath.row]
            StorageManager.deleteObject(note)
            // Delete the row from the data source
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showNoteFromCell" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let note: NoteModel
            note = notes[indexPath.row]
            let detailVC = segue.destination as! DetailVC
            detailVC.currentNote = note
            detailVC.indexPath = indexPath.row
        }
    }
    
    @IBAction func moveBack(_ sender: UIStoryboardSegue) {}
}
