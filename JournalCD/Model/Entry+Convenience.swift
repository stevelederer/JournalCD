//
//  Entry+Convenience.swift
//  JournalCD
//
//  Created by Steve Lederer on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, body: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        // Definition: - a convenience init MUST call a designated initalizer

        self.init(context: context)
        
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
    
}
