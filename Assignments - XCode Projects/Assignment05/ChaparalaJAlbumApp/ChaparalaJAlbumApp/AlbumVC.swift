//
//  AlbumVC.swift
//  ChaparalaJAlbumApp
//
//  Created by Chaparala,Jyothsna on 3/25/23.
//

import UIKit
import AVKit

class AlbumVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var vehicles: [PhotoView]!
    
    var selectedImage: Int = 0
    
    let minimum: CGFloat = 1/25
    let maximum: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = self.minimum
        scrollView.maximumZoomScale = self.maximum
        scrollView.delegate = self
        
        for i in 0..<AppConstant.vehicles.count {
            self.vehicles[i].imageView?.image = UIImage(named: AppConstant.vehicles[i].0)
            self.setAttributes(for: self.vehicles[i].imageView)
            self.likeImage(for: i)
            self.vehicles[i].imageDescription = AppConstant.vehicles[i].1
        }
        self.checkLongPress()
    }

    private func setAttributes(for view: UIView) {
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 10.0
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 2.0
    }
    
    private func likeImage(for index: Int) {
        self.vehicles[index].likeLBL?.text = ""
        self.vehicles[index].likeLBL?.isHidden = true
    }
    
    private func checkLongPress() {
        for tuple in self.vehicles {
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(imageLongPress(_ :)))
            longPress.minimumPressDuration = 0.5
            tuple.imageView.addGestureRecognizer(longPress)
        }
    }
    
    
    @IBAction private func imageLongPress(_ sender: UILongPressGestureRecognizer) {
        self.playSound()
        if sender.state == .ended {
            guard let view = sender.view as? UIImageView else {
                return
            }
            for i in self.vehicles.indices {
                if(view == self.vehicles[i].imageView) {
                    self.selectedImage = i
                }
            }
            self.performSegue(withIdentifier: "ImageDeets", sender: view)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ImageDeets") {
            guard let destination = segue.destination as? ImageDescVC else {
                return
            }
            destination.displayImage = self.selectedImage
        }
    }
    
    private func playSound() {
        let soundID: SystemSoundID = 1110
        AudioServicesPlaySystemSound(soundID)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.contentView
    }
}
