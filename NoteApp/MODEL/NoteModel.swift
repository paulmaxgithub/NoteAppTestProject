//
//  NoteModel.swift
//  NoteApp
//
//  Created by Paul Max on 8/14/20.
//  Copyright © 2020 Paul Max. All rights reserved.
//

import RealmSwift

class NoteModel: Object {
    
    @objc dynamic var title:  String!
    @objc dynamic var note:   String!
    
    convenience init(title: String, note: String) {
        self.init()
        self.title = title
        self.note = note
        
    }
}
