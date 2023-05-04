//
//  BooksVC.swift
//  ChaparalaJExam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class BookDetailsVC: UIViewController {

    @IBOutlet weak var bookIV: UIImageView!
    
    @IBOutlet weak var bookTitleLBL: UILabel!
    
    @IBOutlet weak var bookPriceLBL: UILabel!
    
    @IBOutlet weak var bookDiscountLBL: UILabel!
    
    @IBOutlet weak var totalCostOfBookLBL: UILabel!
    
    var book: Book = Book(title: "", discount: 0, price: 0, image: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bookIV.image = UIImage(named: self.book.image)
        self.bookPriceLBL.text = "Price: $" + String(self.book.price)
        self.bookDiscountLBL.text = "Discount: " + String(self.book.discount) + "%"
        self.bookTitleLBL.text = self.book.title
        self.calculateTotal()
    }
    
    private func calculateTotal() {
        let total = self.book.price - (self.book.price * self.book.discount)/100
        self.totalCostOfBookLBL.text = "Total is $\(String(format: "%.2f", total))"
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
