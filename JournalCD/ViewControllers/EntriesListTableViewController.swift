//
//  EntriesListTableViewController.swift
//  JournalCD
//
//  Created by Steve Lederer on 12/6/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import UIKit
import CoreData

class EntriesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        guard let entry = fetchedResultsController.fetchedObjects?[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timeStamp?.asString
        return cell
    }
    
    let fetchedResultsController: NSFetchedResultsController<Entry> = {
        
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "timeStamp", ascending: true)]
        
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
