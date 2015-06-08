//
//  TaskManager.swift
//  ToDoList
//
//  Created by 許佑任 on 2015/6/7.
//  Copyright (c) 2015年 許佑任. All rights reserved.
//

import UIKit

public class TaskManager: NSObject {

  private let TAG: String = "TaskManager"

  private override init() {
    // do nothing
  }
  deinit { println("\(TAG), is deinit") }

  private static let taskMgrInstance = TaskManager()

  static func getInstance() -> TaskManager {
    return taskMgrInstance
  }

  public struct Task {
    var name: String
    var description: String
  }

  private var taskList:[TaskManager.Task] = []

  func addTask(# name: String, description: String) {
    taskList.append(TaskManager.Task(name: name, description: description))
  }

  func size() -> Int {
    return taskList.count
  }

  func getTask(index: Int) -> TaskManager.Task? {
    if isTaskListValid(index) {
      return taskList[index]
    }
    return nil
  }

  func isTaskListValid(index: Int) -> Bool {
    if index >= 0 && index < taskList.count {
      return true
    }
    return false
  }

  func removeAtIndex(index: Int) -> Bool {
    if isTaskListValid(index) {
      taskList.removeAtIndex(index)
      return true
    }
    return false
  }
}
