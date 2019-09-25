//
//  SongController.swift
//  PlaylistGP
//
//  Created by Zebadiah Watson on 9/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    //Create
    static func createSong(songName: String, artistName: String, to playlist: Playlist){
        Song(songName: songName, artistName: artistName, playlist: playlist) // you could use '_ = Song' or mark with @discardableResult on the convenience
        PlaylistController.shared.saveToPersistentStore()
    }
    //Delete
    static func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}
