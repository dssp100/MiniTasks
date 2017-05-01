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
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        addButton.layer.cornerRadius = 25
        addButton.clipsToBounds = true
        addButton.layer.borderWidth = 3
        addButton.layer.borderColor = UIColor.white.cgColor
        
        tableView.dataSource = self

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = ("\(indexPath.row + 1). \(taskArray[indexPath.row])")
        cell.detailTextLabel?.text = dateArray[indexPath.row]
        
        return cell
    }
    
    //# MARK: - Actions
    
    @IBAction func close(segue: UIStoryboardSegue)
    {
    }
    
    //# TODO: - Add features
    
    
    //# FIXME: - Bug

}
