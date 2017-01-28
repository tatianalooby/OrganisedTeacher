//
//  AddUserInfoViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class AddUserInfoViewController: UIViewController, UITextFieldDelegate {
    
    var connectingSegueID: String = ""
    
    @IBOutlet weak var teachingGroupTextField: UITextField!
    @IBOutlet weak var classroomNumberTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Deactivate the save button until user types some info 
        
        teachingGroupTextField.delegate = self
        classroomNumberTextField.delegate = self
        
        if (teachingGroupTextField.text?.isEmpty)! && (classroomNumberTextField.text?.isEmpty)! {
            
            saveButton.isUserInteractionEnabled = false
        }

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isUserInteractionEnabled = true
    }


    @IBAction func saveButtonTapped(_ sender: Any) {
        
        switch connectingSegueID {
            
        case "Day1VCToAddUserInfoVC":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day1TimeTableInfo = Day1TimeTableInfo(context: context)
            day1TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day1TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(connectingSegueID)
            
        case "Day2VCToAddUserInfoVC":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day2TimeTableInfo = Day2TimeTableInfo(context: context)
            day2TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day2TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(connectingSegueID)
            
        default:
            print("default")
        }
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
