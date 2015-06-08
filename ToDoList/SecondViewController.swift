
//
//  SecondViewController.swift
//  ToDoList
//
//  Created by 許佑任 on 2015/6/7.
//  Copyright (c) 2015年 許佑任. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var tvName: UITextField!
  @IBOutlet weak var tvDescription: UITextField!

  let taskMgrInstance = TaskManager.getInstance()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func onAddTaskListener(sender: UIButton) {
    println("onClick")
    self.view.endEditing(true)
    let name = tvName.text
    let desc = tvDescription.text
    if name.isEmpty || description.isEmpty {
      return
    }
    taskMgrInstance.addTask(name: name, description: desc)
    resetUITextFieldText(tvName, tvDescription)
    self.tabBarController?.selectedIndex = 0
  }

  func resetUITextFieldText(tvs: UITextField...) -> Void {
    for tv in tvs { tv.text = "" }
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    println("Return")
    textField.resignFirstResponder()
    return true
  }

  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    self.view.endEditing(true)
  }
}

