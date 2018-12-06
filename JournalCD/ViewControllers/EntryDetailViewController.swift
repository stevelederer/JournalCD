//
//  EntryDetailViewController.swift
//  JournalCD
//
//  Created by Steve Lederer on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry? // Landing Pad
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    // MARK: - Setup
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text,
            let body = bodyTextView.text else { return }
        if let entry = entry {
            // modify the existing entry
            EntryController.shared.update(entry: entry, newTitle: title, newBody: body)
        } else {
            // create a new entry
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
