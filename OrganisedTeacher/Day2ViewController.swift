//
//  Day2ViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class Day2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var day2TableView: UITableView!
    
    var day2TimeTableInfoArray = [Day2TimeTableInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        day2TableView.delegate = self
        day2TableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get data from core data
        getData()
        
        //reload the tableview
        day2TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day2TimeTableInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = day2TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PrototypeCell
        let day2TimeTableInfo = day2TimeTableInfoArray[indexPath.row]
        cell.day2TeachingGroupLabel.text = day2TimeTableInfo.teachingGroupName
        cell.day2ClassroomNumberLabel.text = day2TimeTableInfo.classroomNumber
        return cell
    }
    
    //delete row
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let day1TimeTableInfo = day2TimeTableInfoArray[indexPath.row]
            context.delete(day1TimeTableInfo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //fetch new updated data from core data
            getData()
            
        }
        //reload new updated data
        day2TableView.reloadData()
    }
    
    //Function to fetch data from core data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            day2TimeTableInfoArray = try context.fetch(Day2TimeTableInfo.fetchRequest())
        } catch {
            print("fetching failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Day2VCToAddUserInfoVC" {
            let controller = segue.destination as! AddUserInfoViewController
            controller.connectingSegueID = "Day2VCToAddUserInfoVC"
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
        print("go back")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
