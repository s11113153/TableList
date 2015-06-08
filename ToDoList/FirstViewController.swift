//
//  FirstViewController.swift
//  ToDoList
//
//  Created by 許佑任 on 2015/6/7.
//  Copyright (c) 2015年 許佑任. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

  let TAG = "FirstViewController"

  var taskMgrInstance = TaskManager.getInstance()

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // this table contains several section
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return taskMgrInstance.size()
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let identifier = "tableViewCellId"
    
    tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)

    var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? UITableViewCell
    if cell == nil {
      println("cell is nil")
      cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
    }

    let task = taskMgrInstance.getTask(indexPath.row)
    if task != nil {
      cell?.textLabel?.text = "name = \(task!.name), description = \(task!.description)"
    }
    return cell!
  }

  override func viewWillAppear(animated: Bool) {
    tableView.reloadData()
    log(TAG, "")
  }

  override func viewDidAppear(animated: Bool) {
    log(TAG, "")
  }

  override func viewWillDisappear(animated: Bool) {
    log(TAG, "")
  }

  override func viewDidDisappear(animated: Bool) {
    log(TAG, "")
  }

  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      taskMgrInstance.removeAtIndex(indexPath.row)
      tableView.reloadData()
    }
  }

  func log(tag: String, _ message: String, funcName: String = __FUNCTION__) {
    println("\(tag) \(funcName):\n\(message)")
  }
}




