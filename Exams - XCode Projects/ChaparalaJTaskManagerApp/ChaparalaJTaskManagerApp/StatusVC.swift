//
//  StatusVC.swift
//  ChaparalaJTaskManagerApp
//
//  Created by Chaparala,Jyothsna on 4/21/23.
//

import UIKit

class StatusVC: UIViewController {

    @IBOutlet weak var completedTasksLBL: UILabel!
    
    @IBOutlet weak var pendingTasksLBL: UILabel!
    
    @IBOutlet weak var canceledTasksLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.completedTasksLBL.text = String(CompletedTasks.tasks.items.count)
        self.pendingTasksLBL.text = String(PendingTasks.tasks.items.count)
        self.canceledTasksLBL.text = String(CancelledTasks.tasks.items.count)
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
