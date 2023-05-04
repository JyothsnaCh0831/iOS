//
//  StudentVC.swift
//  Sec03Exam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class StudentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var studentTV: UITableView!
    
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentTV.dataSource = self
        self.studentTV.delegate = self
        self.studentTV.reloadData()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "showStudentDetails" {
            let desVC = segue.destination as? StudentDetailsVC
            
            desVC?.students = self.students[(self.studentTV.indexPathForSelectedRow?.row)!]
            desVC?.studentType = (self.studentTV.indexPathForSelectedRow?.section)!
            
            self.studentTV.deselectRow(at:self.studentTV.indexPathForSelectedRow!, animated: true)
        }
    }

}

extension StudentVC {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return AppConstants().undergrads.count
        }
        if(section == 1) {
            return AppConstants().graduates.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if(section == 0) {
            let cell = self.studentTV.dequeueReusableCell(withIdentifier: "undergrads", for: indexPath) as! StudentTVC
            cell.fullNameLBL.text = AppConstants().undergrads[indexPath.row].fullName
            cell.startYearLBL.text = "Started:" + String(AppConstants().undergrads[indexPath.row].startMonth) + "/" +
            String(AppConstants().undergrads[indexPath.row].startYear)
            cell.transferCreditsLBL.text = "Transfer Credits: " + String(AppConstants().undergrads[indexPath.row].transferCredits)
            
            return cell
        }
        if(section == 1) {
            let cell = self.studentTV.dequeueReusableCell(withIdentifier: "grads", for: indexPath) as! StudentTVC
            cell.fullNameLBL.text = AppConstants().graduates[indexPath.row].fullName
            cell.startYearLBL.text = "Started:" + String(AppConstants().graduates[indexPath.row].startMonth) + "/" + String(AppConstants().graduates[indexPath.row].startYear)
            cell.transferCreditsLBL.text = "Transfer Credits: " +  String(AppConstants().graduates[indexPath.row].transferCredits)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Under Graduate"
        } else {
            return "Graduate"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if(section == 0) {
            self.students = AppConstants().undergrads
        } else {
            self.students = AppConstants().graduates
        }
        self.performSegue(withIdentifier: "showStudentDetails", sender: self)
    }
}
