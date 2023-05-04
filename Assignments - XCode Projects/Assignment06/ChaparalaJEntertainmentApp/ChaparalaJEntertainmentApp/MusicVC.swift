//
//  MusicVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit
import ViewAnimator

class MusicVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var musicTV: UITableView!
    
    var favourites: [Music] = []
    var selectedSong: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.musicTV.delegate = self
        self.musicTV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.musicTV.reloadData()
        self.animateTVC(cells: self.musicTV.visibleCells)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return songs.count
        } else {
            return self.favourites.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if(section == 0) {
            let cell = self.musicTV.dequeueReusableCell(withIdentifier: "tracks", for: indexPath) as! MusicTVC
            cell.titleLBL.text = songs[indexPath.row].title
            cell.detailLBL.text = songs[indexPath.row].composer
            return cell
        } else {
            let cell = self.musicTV.dequeueReusableCell(withIdentifier: "tracks", for: indexPath) as! MusicTVC
            if(self.favourites.count > 0) {
                cell.titleLBL.text = self.favourites[indexPath.row].title
                cell.detailLBL.text = self.favourites[indexPath.row].composer
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Songs"
        } else {
            return "Favourites"
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if(section == 0) {
            self.selectedSong = songs[indexPath.row].videoId
        } else {
            self.selectedSong = self.favourites[indexPath.row].videoId
        }
        self.performSegue(withIdentifier: "playTrack", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifer = segue.identifier, identifer == "playTrack" {
            let desVC = segue.destination as? PlayMusicVC
            
            desVC?.videoID = self.selectedSong
            self.musicTV.deselectRow(at: self.musicTV.indexPathForSelectedRow!, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favaction = UIContextualAction(style: .normal, title: "♡", handler: {
            [weak self] (action, swipeButtonView, completion) in
            
            let test = self?.favourites.contains(where: {
                track in
                return track.videoId == songs[indexPath.row].videoId
            })
            if(test == false) {
                self?.favourites.append(songs[indexPath.row])
                self?.musicTV.reloadData()
            }
            completion(true)
        })
        favaction.backgroundColor = UIColor.purple
        return UISwipeActionsConfiguration(actions: [favaction])
    }
}

extension MusicVC {
    func animateTVC(cells: [UITableViewCell]) {
        let from = AnimationType.from(direction: .bottom, offset: 50.0)
        let zoom = AnimationType.zoom(scale: 1.5)
        UIView.animate(
            views: cells,
            animations: [from, zoom],
            reversed: false,
            initialAlpha: 0.0,
            finalAlpha: 1.0,
            delay: 0.0,
            animationInterval: 0.2,
            duration: 1.0,
            usingSpringWithDamping: ViewAnimatorConfig.springDampingRatio,
            initialSpringVelocity: ViewAnimatorConfig.initialSpringVelocity,
            completion: nil
        )
    }
}
