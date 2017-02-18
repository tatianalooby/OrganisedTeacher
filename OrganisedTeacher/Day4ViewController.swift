//
//  Day4ViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 16/02/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class Day4ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var day4TableView: UITableView!
    
    
    var day4TimeTableInfoArray = [Day4TimeTableInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        day4TableView.delegate = self
        day4TableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get data from core data
        getData()
        
        //reload the tableview
        day4TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day4TimeTableInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = day4TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PrototypeCell
        let day4TimeTableInfo = day4TimeTableInfoArray[indexPath.row]
        cell.day4TeachingGroupLabel.text = day4TimeTableInfo.teachingGroupName
        cell.day4ClassroomNumberLabel.text = day4TimeTableInfo.classroomNumber
        return cell
    }
    
    //delete row
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let day4TimeTableInfo = day4TimeTableInfoArray[indexPath.row]
            context.delete(day4TimeTableInfo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //fetch new updated data from core data
            getData()
            
        }
        //reload new updated data
        day4TableView.reloadData()
    }
    
    //Function to fetch data from core data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            day4TimeTableInfoArray = try context.fetch(Day4TimeTableInfo.fetchRequest())
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
