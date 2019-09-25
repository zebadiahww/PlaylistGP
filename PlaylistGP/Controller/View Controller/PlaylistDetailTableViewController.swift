//
//  PlaylistDetailTableViewController.swift
//  PlaylistGP
//
//  Created by Zebadiah Watson on 9/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class PlaylistDetailTableViewController: UITableViewController {
    
    var playlist: Playlist?

    @IBOutlet weak var ArtistNameTextField: UITextField!
    
    
    @IBOutlet weak var SongNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func AddButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
        let songName = SongNameTextField.text,
        let artistName = ArtistNameTextField.text
            else { return }
        SongController.createSong(songName: songName, artistName: artistName, to: playlist)
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        guard let unwrappedPlaylist = playlist,
            let song = unwrappedPlaylist.songs?[indexPath.row] as? Song else { return UITableViewCell() }
        //let song = playlist?.songs?[indexPath.row] as? Song
        
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.artistName
        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist,
            let song = playlist.songs?[indexPath.row] as? Song
                else { return }
            
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
