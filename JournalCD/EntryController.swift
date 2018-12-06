//
//  EntryController.swift
//  JournalCD
//
//  Created by Steve Lederer on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    // 1) Shared Instance AKA Singleton
    static let shared = EntryController()
    private init() {}
    
    // MARK: - CRUD Functions
    func addEntryWith(title: String, body: String) {
        let _ = Entry(title: title, body: body)
        saveToPersistentStore()
    }
    func update(entry: Entry, newTitle: String, newBody: String) {
        entry.title = newTitle
        entry.body = newBody
        saveToPersistentStore()
    }
    func delete(entry: Entry) {
        entry.managedObjectContext?.delete(entry)
        //the above line asks the entry what MOC it is in, and then asks the MOC to delete said entry
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) :  \(error) \(error.localizedDescription)")
        }
    }
    
}
