//
//  DateExtension.swift
//  JournalCD
//
//  Created by Steve Lederer on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation

extension Date {
    
    var asString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
