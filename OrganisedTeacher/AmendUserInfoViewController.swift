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
    
    var dayTimeTableInfoArray = [DayTimeTableInfo]()
    
    var tagToReceive: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let tag = tagToReceive {
            print(tag)
            let dayTimeTableInfo = dayTimeTableInfoArray[tag]
            startTextField.text = dayTimeTableInfo.startTime
            finishTextField.text = dayTimeTableInfo.finishTime
            classNameTextField.text = dayTimeTableInfo.teachingGroupName
            classroomTextField.text = dayTimeTableInfo.classroomNumber
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
            dayTimeTableInfoArray = try context.fetch(DayTimeTableInfo.fetchRequest())
            print("fetching success")
        } catch {
            print("fetching failed")
        }
    }

    @IBAction func deleteButtonTapped(_ sender: CustomButton) {
        print("Delete button tapped")
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if let tag = tagToReceive {
            let dayTimeTableInfo = dayTimeTableInfoArray[tag]
            context.delete(dayTimeTableInfo)
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
