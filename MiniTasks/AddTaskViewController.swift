//
//  AddTaskViewController.swift
//  MiniTasks
//
//  Created by Daniel Springer on 30/04/2017.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit

var taskArray = [String]()
var dateArray = [String]()
let defaults = UserDefaults.standard


class AddTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    //# MARK: - Outlets
    
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var addTaskButton: UIButton!
    
    @IBOutlet weak var addItemField: UITextField!

    
    
    
    
    //# MARK: - Variables

    
    var task = ["Select Task", "Go to Dentist", "Meet Friends", "Iron Cloths", "Call Parents", "Pay Bils", "Paint Desk", "Call Insurance Company", "Buy Gifts for Wife", "Take Kids Out", "Go for Swimming lesson", "Play Tennis", "Clean the House", "Track Package"]
    
//    let myTasks = defaults.array(forKey: "selectedTask")
    


    
    
    var dateFormatter = DateFormatter()
    
    var selectedTask = ""
    
    
    //# MARK: - Functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        
        pickerView.delegate = self
        
        addTaskButton.isEnabled = false
        
        datePicker.minimumDate = Date()
        
        dateFormatter.dateFormat = ("EE dd MMM yyyy @ HH:mm")
        
        addTaskButton.layer.cornerRadius = 10
        addTaskButton.layer.borderColor = UIColor.white.cgColor
        addTaskButton.layer.borderWidth = 3
        addTaskButton.clipsToBounds = true
        

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return task.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        
        return task[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row == 0
        {
            addTaskButton.isEnabled = false
        }
        else
        {
            addTaskButton.isEnabled = true
        
            selectedTask = task[row]
        }
        
        //print(task[row])
    }
    
    
    //# MARK: - Actions
    
    
    //# TODO: - Add features

    @IBAction func addTask(_ sender: Any)
    {
        
        taskArray.append(selectedTask)
        UserDefaults.standard.set(taskArray, forKey: "myTasks")
        defaults.synchronize()
        
        let date = datePicker.date
        let dateStr = dateFormatter.string(from: date)
        dateArray.append(dateStr)

        
        dismiss(animated: true, completion: nil)
    }
    


    @IBAction func addItemButton(_ sender: Any)
    {
        if addItemField.text != ""
        {
        task.append(addItemField.text!)
        addItemField.text = ""
        
        print(task)
        pickerView.reloadAllComponents()
        }
    }
    
    
    //# FIXME: - Bug
}
