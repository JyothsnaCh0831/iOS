//
//  Model.swift
//  ChaparalaJTaskManagerApp
//
//  Created by Chaparala,Jyothsna on 4/21/23.
//

import Foundation

struct TaskLists {
    var items: [String]
}

struct PendingTasks {
    static var tasks = TaskLists(items: [])
}

struct CompletedTasks {
    static var tasks = TaskLists(items: [])
}

struct CancelledTasks {
    static var tasks = TaskLists(items: [])
}
