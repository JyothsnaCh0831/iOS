//
//  BookDetailVC.swift
//  ChaparalaJExam02
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit

class BookDetailVC: UIViewController {
    
    @IBOutlet weak var bookIV: UIImageView!

    @IBOutlet weak var bookTitleLBL: UILabel!
    
    @IBOutlet weak var bookPriceLBL: UILabel!
    
    @IBOutlet weak var bookDiscountLBL: UILabel!
    
    @IBOutlet weak var totalCostOfBookLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
