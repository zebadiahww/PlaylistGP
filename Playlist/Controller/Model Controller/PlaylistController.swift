//
//  PlaylistController.swift
//  PlaylistGP
//
//  Created by Zebadiah Watson on 9/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // Singleton
    static let shared = PlaylistController()
    
    //local SOT - use a computed property to create
    var playlists: [Playlist] {
       
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
      
    }
    
    //CRUD
    //Create - declare a new constant named playnasty of type Playlist and pass in the name
    // underscore cause it doesnt matter what this name is
    func createPlaylist(withName name: String) {
        _ = Playlist(playlistName: name)
        saveToPersistentStore()
    }
    
    
    //Delete
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }
    
    //Update - no update cause Karl doesnt have time today....
    
    //Save
    func saveToPersistentStore() {
        // DO, TRY, CATCH
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the Objects on \(#function): \(error.localizedDescription)")
        }
        
    }
    //Load - we do not need Load function because it is on the CoreDataStack

}// End of Class
