//
//  AmendUserInfoViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 18/02/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit
import CoreData

class AmendUserInfoViewController: UIViewController {

    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    
    @IBOutlet weak var startTextField: UITextField!
    
    @IBOutlet weak var finishTextField: UITextField!
    
    @IBOutlet weak var classNameLabel: UILabel!
    
    @IBOutlet weak var classroomLabel: UILabel!
    
    @IBOutlet weak var classNameTextField: UITextField!
    
    @IBOutlet weak var classroomTextField: UITextField!
    
    var day1TimeTableInfoArray = [Day1TimeTableInfo]()
    
    var tagToReceive: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let tag = tagToReceive {
            print(tag)
            let day1TimeTableInfo = day1TimeTableInfoArray[tag]
            startTextField.text = day1TimeTableInfo.startTime
            finishTextField.text = day1TimeTableInfo.finishTime
            classNameTextField.text = day1TimeTableInfo.teachingGroupName
            classroomTextField.text = day1TimeTableInfo.classroomNumber
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get data from core data
        getData()
        print("view will appear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function to fetch data from core data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            day1TimeTableInfoArray = try context.fetch(Day1TimeTableInfo.fetchRequest())
            print("fetching success")
        } catch {
            print("fetching failed")
        }
    }

    @IBAction func deleteButtonTapped(_ sender: CustomButton) {
        print("Delete button tapped")
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if let tag = tagToReceive {
            let day1TimeTableInfo = day1TimeTableInfoArray[tag]
            context.delete(day1TimeTableInfo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        //fetch new updated data from core data
        getData()
        
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
