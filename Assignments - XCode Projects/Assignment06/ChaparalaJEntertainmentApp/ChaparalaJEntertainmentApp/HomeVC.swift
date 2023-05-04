//
//  HomeVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var fullNameLBL: UILabel!
    
    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var phoneLBL: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!

    @IBOutlet weak var profileIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setAttributes(for: self.profileIV)
        self.fullNameLBL.text = "Jane Doe"
        self.profileIV.image = UIImage(named: "profile")
        self.emailLBL.text = "something@gmail.com"
        self.phoneLBL.text = "+1(123) 456-789"
        self.bioTextView.text = "I am a graduate student pursing Masters at Northwest Missouri State University, MO. My major is Applied Computer Science. I will be graduated in May 2023."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func setAttributes(for view: UIView) {
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2.0
        view.layer.borderColor = CGColor(red: CGFloat(0), green: CGFloat(103), blue: CGFloat(71), alpha: 1)
    }

}
