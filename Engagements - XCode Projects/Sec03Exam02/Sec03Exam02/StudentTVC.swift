//
//  StudentTVC.swift
//  Sec03Exam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class StudentTVC: UITableViewCell {

    @IBOutlet weak var studentIV: UIImageView!
    
    @IBOutlet weak var fullNameLBL: UILabel!
    
    @IBOutlet weak var startYearLBL: UILabel!
    
    @IBOutlet weak var transferCreditsLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
