//
//  PhotoView.swift
//  ChaparalaJAlbumApp
//
//  Created by Chaparala,Jyothsna on 3/25/23.
//

import UIKit
import AVKit

class PhotoView: UIView {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.isUserInteractionEnabled = true
            
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(_ :)))
            doubleTap.numberOfTapsRequired = 2
            self.imageView.addGestureRecognizer(doubleTap)
        }
    }
    
    @IBOutlet weak var likeLBL: UILabel!
    
    var imageDescription: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp() {
        let viewFromXib = Bundle.main.loadNibNamed("PhotoView", owner: self)![0] as! UIView
        viewFromXib.frame = self.bounds
        self.addSubview(viewFromXib)
    }
    
    @IBAction private func onDoubleTap(_ sender: UITapGestureRecognizer) {
        playSound()
        if(self.likeLBL?.text == "") {
            self.likeLBL?.text = "❤️"
            self.likeLBL?.isHidden = false
        } else {
            self.likeLBL?.isHidden = true
        }
    }
    
    private func playSound() {
        let soundID: SystemSoundID = 1111
        AudioServicesPlaySystemSound(soundID)
    }

}
