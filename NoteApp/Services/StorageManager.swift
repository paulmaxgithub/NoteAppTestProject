//
//  StorageManager.swift
//  NoteApp
//
//  Created by Paul Max on 8/16/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ note: NoteModel) {
        
        try! realm.write {
            realm.add(note)
        }
    }
    
    static func deleteObject(_ note: NoteModel) {
        
        try! realm.write {
            realm.delete(note)
        }
    }
}
