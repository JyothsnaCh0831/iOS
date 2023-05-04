//
//  BooksVC.swift
//  ChaparalaJExam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class BooksVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var booksTV: UITableView!
    
    var book: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.booksTV.delegate = self
        self.booksTV.dataSource = self
        self.booksTV.reloadData()

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

extension BooksVC {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return AppConstants().newArrivals.count
        case 1:
            return AppConstants().trendingBooks.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        var identifer = ""
        var title = ""
        var discount: Double = 0
        
        switch section {
        case 0:
            identifer = "newArrivals"
            title = AppConstants().newArrivals[indexPath.row].title
            discount = AppConstants().newArrivals[indexPath.row].discount
        case 1:
            identifer = "trending"
            title = AppConstants().trendingBooks[indexPath.row].title
            discount = AppConstants().trendingBooks[indexPath.row].discount
        default:
            break
        }
        
        let cell = self.booksTV.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as! BooksTVC
        cell.titleLBL.text = title
        cell.subtitleLBL.text = "Discount: " + String(discount) + "%"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "New Arrivals"
        case 1:
            return "Trending"
        default:
            break
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        
        switch section {
        case 0:
            self.book = AppConstants().newArrivals
        case 1:
            self.book = AppConstants().trendingBooks
        default:
            break
        }
        self.performSegue(withIdentifier: "showBooksDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "showBooksDetails" {
            let desVC = segue.destination as? BookDetailsVC
            desVC?.book = book[(self.booksTV.indexPathForSelectedRow?.row)!]
            self.booksTV.deselectRow(at: self.booksTV.indexPathForSelectedRow!, animated: true)
        }
    }
}
