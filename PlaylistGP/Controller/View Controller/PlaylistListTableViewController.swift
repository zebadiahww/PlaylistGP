//
//  PlaylistListTableViewController.swift
//  PlaylistGP
//
//  Created by Zebadiah Watson on 9/25/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {
    
    @IBOutlet weak var PlaylistNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    @IBAction func addButtonPlaylistTapped(_ sender: Any) {
        guard let name = PlaylistNameTextField.text else { return }
        PlaylistController.shared.createPlaylist(withName: name)
        
        //clean up the dust
        PlaylistNameTextField.text = ""
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        cell.textLabel?.text = playlist.playlistName
        cell.detailTextLabel?.text = "\(songCount)"
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlist: playlist)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        //
        // Identifier: what segue was triggered? if this particular
        if segue.identifier == "toDetailVC" {
            
            // Index: what cell triggered the segue
            //
            guard let indexPathForTheCellThatWasTapped = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? PlaylistDetailTableViewController else {return}
            
            // Object: to send. what object am I trying to send
            let objectToSend = PlaylistController.shared.playlists[indexPathForTheCellThatWasTapped.row]
            
            // Object: to receive. what object will "catch" this data
            destinationVC.playlist = objectToSend
        }
    }
}

