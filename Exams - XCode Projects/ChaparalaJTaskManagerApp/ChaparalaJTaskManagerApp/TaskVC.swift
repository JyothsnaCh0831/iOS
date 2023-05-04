//
//  TaskVC.swift
//  ChaparalaJTaskManagerApp
//
//  Created by Chaparala,Jyothsna on 4/21/23.
//

import UIKit

class TaskVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateTaskDelegete {
    
    func addTask() {
        print("Modal dismissed")
        self.tasksTableView.reloadData()
    }

    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        
        let task = CreateTasKVC()
        task.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tasksTableView.reloadData()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return PendingTasks.tasks.items.count
        } else if(section == 1) {
            return CompletedTasks.tasks.items.count
        } else {
            return CancelledTasks.tasks.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if(section == 0) {
            let cell = self.tasksTableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath) as! TaskTVC
            
            cell.taskLBL.text = PendingTasks.tasks.items[indexPath.row]
            
            return cell
        } else if(section == 1) {
            let cell = self.tasksTableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath) as! TaskTVC
            
            cell.taskLBL.text = CompletedTasks.tasks.items[indexPath.row]
            
            return cell
        } else {
            let cell = self.tasksTableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath) as! TaskTVC
            
            cell.taskLBL.text = CancelledTasks.tasks.items[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Pending"
        } else if(section == 1) {
            return "Completed"
        } else {
            return "Cancelled"
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete", handler: {
            (action, swipeButtonView, completionHandler) in
            CompletedTasks.tasks.items.append(PendingTasks.tasks.items[indexPath.row])
            PendingTasks.tasks.items.remove(at: indexPath.row)
            self.tasksTableView.reloadData()
            completionHandler(true)
        })
        completeAction.backgroundColor = UIColor.green
        
        let cancelAction = UIContextualAction(style: .normal, title: "Cancel", handler: {
            (action, swipeButtonView, completionHandler) in
            CancelledTasks.tasks.items.append(PendingTasks.tasks.items[indexPath.row])
            PendingTasks.tasks.items.remove(at: indexPath.row)
            self.tasksTableView.reloadData()
            completionHandler(true)
        })
        cancelAction.backgroundColor = UIColor.red
        
        return UISwipeActionsConfiguration(actions: [cancelAction, completeAction])
    }

}

