//
//  Day1ViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit
import CoreData

class DayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dayIndex: Int?
    
    var colorArray: [UIColor] = [.red, .green, .yellow, .orange, .cyan]
    
    @IBOutlet weak var dayTableView: UITableView!
    
    var dayTimeTableInfoArray = [DayTimeTableInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayTableView.delegate = self
        dayTableView.dataSource = self
        dayTableView.backgroundColor = colorArray[dayIndex!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get data from core data
        print("DayVC view will appear")
        
        getData()
        
        //reload the tableview
        self.dayTableView.reloadData()
        print("reload dayTableView success")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayTimeTableInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dayTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PrototypeCell
        let dayTimeTableInfo = dayTimeTableInfoArray[indexPath.row]
        //NEED TO DO: cell.day1InfoButton.isHidden = true
        cell.day1InfoButton.tag = indexPath.row
        cell.day1InfoButton.addTarget(self, action: #selector(addInfoButtonTapped(button:)), for: UIControlEvents.touchUpInside)
        cell.day1StartTimeLabel.text = dayTimeTableInfo.startTime
        cell.day1FinishTimeLabel.text = dayTimeTableInfo.finishTime
        cell.day1TeachingGroupLabel.text = dayTimeTableInfo.teachingGroupName
        cell.day1ClassroomNumberLabel.text = dayTimeTableInfo.classroomNumber
        return cell
    }
    
    // Enable row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
        
    }
    
    //Function to fetch data from core data
    func getData() {
        
        let index = String(describing: dayIndex!)
        print(index)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let request: NSFetchRequest<DayTimeTableInfo> = DayTimeTableInfo.fetchRequest()
            request.predicate = NSPredicate(format: "day == %@", index)
            dayTimeTableInfoArray = try context.fetch(request)
            print("fetching success")
        } catch {
            print("fetching failed")
        }
    }
    
    
    func addInfoButtonTapped(button: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AmendUserInfoViewController") as! AmendUserInfoViewController
        print("info button tapped")
        let tagToPass = button.tag
        controller.tagToReceive = tagToPass
        print(tagToPass)
        self.navigationController?.pushViewController(controller, animated: true)
        controller.viewWillAppear(true)
        print("presented")
    }
    
    // Unwind segue from AddUserInfoViewController
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
        print("go back")
        
    }
    
    //Unwind seque from AmendUSerInfoViewController
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
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

