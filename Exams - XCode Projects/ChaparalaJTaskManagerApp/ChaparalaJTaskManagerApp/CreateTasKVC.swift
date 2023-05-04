//
//  CreateTasKVC.swift
//  ChaparalaJTaskManagerApp
//
//  Created by Chaparala,Jyothsna on 4/21/23.
//

import UIKit
import Lottie

protocol CreateTaskDelegete: AnyObject {
    func addTask()
}


class CreateTasKVC: UIViewController {

    @IBOutlet weak var taskTF: UITextField!
    
    @IBOutlet weak var createTaskBTN: UIButton!
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    weak var delegate: CreateTaskDelegete?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createTaskBTN.isEnabled = false
         
    }
    
    @IBAction func readTask(_ sender: UITextField) {
        guard let task = self.taskTF.text, !task.isEmpty else {
            return
        }
        
        self.createTaskBTN.isEnabled = true
    }
    
    @IBAction func createTask(_ sender: UIButton) {
        
        guard let task = self.taskTF.text, !task.isEmpty else {
            return
        }
        
        PendingTasks.tasks.items.append(task)
        
        self.lottieView.animation = LottieAnimation.named("586-added")
        self.lottieView.backgroundColor = .clear
        self.lottieView.loopMode = .playOnce
        self.lottieView.play(completion: { [weak self] _ in
            print("Lottie View")
            self?.dismissModal()
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func dismissModal() {
        print("Inside dismissModal()")
        
        dismiss(animated: true, completion: { [weak self] in
            self?.delegate?.addTask()
        })
        
        
    }

}
