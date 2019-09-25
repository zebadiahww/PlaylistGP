//
//  CoreDataStack.swift
//  PlaylistGP
//
//  Created by Zebadiah Watson on 9/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Playlist") // change what container is named
        // underscore means I dont give an F or S
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failed to load Persistent Store \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
