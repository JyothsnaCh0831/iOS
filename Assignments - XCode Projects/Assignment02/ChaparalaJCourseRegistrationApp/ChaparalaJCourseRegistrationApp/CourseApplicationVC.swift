//
//  ViewController.swift
//  ChaparalaJCourseRegistrationApp
//
//  Created by Chaparala,Jyothsna on 2/7/23.
//

import UIKit

class CourseApplicationVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    @IBOutlet var courseSWCH: [UISwitch]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initially, making the message empty and switches to untoggle
        self.messageLBL.text = ""
        for i in courseSWCH! {
            i.isOn = false;
        }
    }
    
    
    @IBAction func toggleCourse(_ sender: UISwitch) {
        
    }
    
    @IBAction func onReset(_ sender: UIButton) {
        // Resetting all the swtiches to untoggle and message, names to empty
        self.messageLBL.text = ""
        self.firstNameTF.text = ""
        self.lastNameTF.text = ""
        for i in courseSWCH! {
            i.isOn = false;
        }
    }
    
    @IBAction func onSubmit(_ sender: UIButton) {
        
        // Checking if the names are empty or not
        guard let fName = self.firstNameTF.text, !fName.isEmpty,
              let lName = self.lastNameTF.text, !lName.isEmpty else {
            self.messageLBL.text  = "Please enter your full name."
            return
        }
        
        // Reading the names from the text fields
        let name_first = self.firstNameTF.text ?? ""
        let name_last = self.lastNameTF.text ?? ""
        
        // Checking if any switch is toggled or not
        var flag = false
        for i in courseSWCH {
            if(i.isOn == true) {
                flag = true
                break
            }
        }
        
        // If no switch is toggled, printing the message
        if(flag == false) {
            self.messageLBL.text  = "Hi \(name_first), \(name_last) please select the courses of your choice."
        }
        // if switches are toggled
        else {
            var courses = "", result = ""
            var count = 0
            
            // calculating the count and storing the switch details
            for i in courseSWCH {
                if(i.isOn == true) {
                    count += 1
                    courses += String(i.tag)
                }
            }
            
            // assigning the courses according to toggled switches.
            switch courses {
            case "0":
                result = "iOS"
            case "1":
                result = "Patterns"
            case "2":
                result = "Big Data"
            case "01", "10":
                result = "iOS, Patterns"
            case "02", "20":
                result = "iOS, Big Data"
            case "12", "21":
                result = "Patterns, Big Data"
            default:
                result = "iOS, Patterns, Big Data"
            }
            
            // final message
            self.messageLBL.text  = "CONFIRMATION\n \(name_first), \(name_last) has successfully enrolled in \(count) course(s), namely, \(result)."
        }
    }
}

