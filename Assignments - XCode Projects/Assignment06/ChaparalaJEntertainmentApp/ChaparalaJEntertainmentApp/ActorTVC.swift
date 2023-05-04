//
//  ActorTVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/20/23.
//

import UIKit

class ActorTVC: UITableViewCell {

    @IBOutlet weak var actorIV: UIImageView!
    
    @IBOutlet weak var actorNameLBL: UILabel!
    
    @IBOutlet weak var yearsActiveLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setAttributes(for: self.actorIV)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setAttributes(for view: UIView) {
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
    }
}
