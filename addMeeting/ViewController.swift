//
//  ViewController.swift
//  addMeeting
//
//  Created by Madeline Webster on 4/3/18.
//  Copyright © 2018 Madeline Webster. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    var actionList = ["Purpose"]
    var subtitleList = [""]
@IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    
    
    // Unwind Save Button
    @IBAction func unwindSaveNewToDo(unwindSegue: UIStoryboardSegue) {
        if let addPurposeVC = unwindSegue.source as? AddPurposeViewController {
            if addPurposeVC.newPurpose.count != 0 {
                if let index = subtitleList.index(of: subtitleList.first!) {
                    subtitleList.remove(at: index)
                    subtitleList.append(addPurposeVC.newPurpose)
//                cell!.textLabel?.text = addPurposeVC.newPurpose
//                actionList.append(addPurposeVC.newPurpose)
                    
                }
            }
        }
    }
    
//  Unwind Cancel Button
    @IBAction func unwindCancelNewToDo(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionList.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveNewMeeting" {
            subtitleList = [subtitleList.first!]
        }
    }
    
//    Text for table view cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
        let text = actionList[indexPath.row]
        let subtitle = subtitleList[indexPath.row]
        cell!.textLabel?.text = text
        cell!.detailTextLabel?.text = subtitle
        return cell!
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
