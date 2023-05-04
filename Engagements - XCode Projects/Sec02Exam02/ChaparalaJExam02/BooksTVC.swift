//
//  BooksTVC.swift
//  ChaparalaJExam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class BooksTVC: UITableViewCell {
    
    @IBOutlet weak var bookIV: UIImageView!
    
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var subtitleLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
