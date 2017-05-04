//
//  HomeViewController.swift
//  MiniTasks
//
//  Created by Daniel Springer on 30/04/2017.
//  Copyright © 2017 Daniel Springer. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDataSource
{
    //# MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    //# MARK: - Variables
    
    //# MARK: - Functions
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        print(defaults.stringArray(forKey: "taskArray") ?? [String]())
        print(defaults.stringArray(forKey: "dateArray") ?? [String]())
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 25
        addButton.clipsToBounds = true
        addButton.layer.borderWidth = 3
        addButton.layer.borderColor = UIColor.white.cgColor
        
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let task = defaults.stringArray(forKey: "taskArray") ?? [String]()
        let date = defaults.stringArray(forKey: "dateArray") ?? [String]()
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = ("\(indexPath.row + 1). \(task[indexPath.row])")
        
        cell.detailTextLabel?.text = date[indexPath.row]
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            taskArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    //# MARK: - Actions
    
    @IBAction func close(segue: UIStoryboardSegue)
    {
    }
    
    //# TODO: - Add features
    
    
    //# FIXME: - Bug
    
}

