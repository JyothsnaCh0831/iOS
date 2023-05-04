//
//  PlayMusicVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class PlayMusicVC: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var videoPlayerView: YTPlayerView!
    
    var videoID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.videoPlayerView.delegate = self
        self.videoPlayerView.load(withVideoId: self.videoID)
        // Do any additional setup after loading the view.
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
