//
//  Day3ViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 16/02/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class Day3ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var day3TableView: UITableView!

    
    var day3TimeTableInfoArray = [Day3TimeTableInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        day3TableView.delegate = self
        day3TableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get data from core data
        getData()
        
        //reload the tableview
        day3TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day3TimeTableInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = day3TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PrototypeCell
        let day3TimeTableInfo = day3TimeTableInfoArray[indexPath.row]
        cell.day3TeachingGroupLabel.text = day3TimeTableInfo.teachingGroupName
        cell.day3ClassroomNumberLabel.text = day3TimeTableInfo.classroomNumber
        return cell
    }
    
    //delete row
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let day3TimeTableInfo = day3TimeTableInfoArray[indexPath.row]
            context.delete(day3TimeTableInfo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //fetch new updated data from core data
            getData()
            
        }
        //reload new updated data
        day3TableView.reloadData()
    }
    
    //Function to fetch data from core data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            day3TimeTableInfoArray = try context.fetch(Day3TimeTableInfo.fetchRequest())
        } catch {
            print("fetching failed")
        }
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "Day1VCToAddUserInfoVC" {
    //            let controller = segue.destination as! AddUserInfoViewController
    //            controller.connectingSegueID = "Day1VCToAddUserInfoVC"
    //        }
    //    }
    
    //    @IBAction func addButtonTapped(_ sender: Any) {
    //
    //    }
    
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
