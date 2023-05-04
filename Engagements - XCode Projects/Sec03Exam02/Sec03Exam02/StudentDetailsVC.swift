//
//  StudentDetailsVC.swift
//  Sec03Exam02
//
//  Created by Chaparala,Jyothsna on 4/15/23.
//

import UIKit

class StudentDetailsVC: UIViewController {

    @IBOutlet weak var studentIV: UIImageView!
    
    @IBOutlet weak var nameLBL: UILabel!
    
    @IBOutlet weak var transferCreditsLBL: UILabel!
    
    @IBOutlet weak var earliestGraduationLBL: UILabel!
    
    @IBOutlet weak var latestGraduationLBL: UILabel!
    
    var studentType: Int = -1
    var students: Student = Student(fullName: "", transferCredits: 0, startYear: 0, startMonth: 0 )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLBL.text = self.students.fullName
        self.transferCreditsLBL.text = "\(self.students.transferCredits)"
        self.calculateGrades()
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
    
    private func calculateGrades() {
        if(self.studentType == 0) {
            let total = self.students.transferCredits + UtilityConstants.underGradTotal
            self.earliestGraduationLBL.text = "\(round(total/UtilityConstants.underGradMax)) semesters excluding summer semesters"
            self.latestGraduationLBL.text = "\(round(total/UtilityConstants.underGradMin)) semesters excluding summer semesters"
        }
        if(self.studentType == 1) {
            let total = self.students.transferCredits + UtilityConstants.gradTotal
            self.earliestGraduationLBL.text = "\(round(total/UtilityConstants.gradMax)) semesters excluding summer semesters"
            self.latestGraduationLBL.text = "\(round(total/UtilityConstants.gradMin)) semesters excluding summer semesters"
        }
    }

}
