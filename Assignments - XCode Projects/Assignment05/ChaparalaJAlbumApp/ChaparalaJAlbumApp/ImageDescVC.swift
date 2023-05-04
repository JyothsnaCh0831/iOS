//
//  ImageDescVC.swift
//  ChaparalaJAlbumApp
//
//  Created by Chaparala,Jyothsna on 3/25/23.
//

import UIKit

class ImageDescVC: UIViewController {
    var displayImage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setVariables()
    }
    

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            
            self.imageView.isUserInteractionEnabled = true
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(imageSwipedDown(_ :)))
            downSwipe.direction = .down
            self.imageView.addGestureRecognizer(downSwipe)
            
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(imageSwipedUp(_ :)))
            upSwipe.direction = .up
            self.imageView.addGestureRecognizer(upSwipe)
        }
    }
    
    @IBOutlet weak var descTV: UITextView!
    
    private func setVariables() {
        self.imageView.image = UIImage(named: AppConstant.vehicles[displayImage].0)
        self.imageView.layer.cornerRadius = 20.0
        self.descTV.text = AppConstant.vehicles[displayImage].1
    }

    @IBAction func imageSwipedDown(_ sender: UISwipeGestureRecognizer) {
        guard let image = sender.view else {
            return
        }
        
        image.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    
    @IBAction func imageSwipedUp(_ sender: UISwipeGestureRecognizer) {
        guard let image = sender.view else {
            return
        }
        image.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
}
