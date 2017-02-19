//
//  AddUserInfoViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class AddUserInfoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate {
    
    var senderVCIdentifier: String = ""
        
    var customTimePicker: UIPickerView!
    
    var hours = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    var minutes = ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]
    
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var finishLabel: UILabel!
    
    @IBOutlet weak var startTextField: UITextField!
    
    @IBOutlet weak var finishTextField: UITextField!
    
    @IBOutlet weak var teachingGroupTextField: UITextField!
    @IBOutlet weak var classroomNumberTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.setTitleColor(UIColor(red: 0, green: 125/255, blue: 1.0, alpha: 1.0), for: UIControlState.normal)
        
        //startTextField.delegate = self
        
        // Instantiate customPickerView
        customTimePicker = UIPickerView()
        customTimePicker.dataSource = self
        customTimePicker.delegate = self
        
        // Set input from customPickerView
        self.startTextField.inputView = customTimePicker
        self.finishTextField.inputView = customTimePicker
        
        // Enable action when user taps startTextField or finishTextField
        startTextField.addTarget(self, action: #selector(didTouchDownStartTextField(textField:)), for: UIControlEvents.touchDown)

        finishTextField.addTarget(self, action: #selector(didTouchDownFinishTextField(textField:)), for: UIControlEvents.touchDown)
        
        // Add tap gesture to dismiss customPickerView when user taps anywhere on the view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideCustomTimePicker))
        view.addGestureRecognizer(tapGesture)

        //Deactivate the save button until user types some info 
        
        teachingGroupTextField.delegate = self
        classroomNumberTextField.delegate = self
        
        if (teachingGroupTextField.text?.isEmpty)! && (classroomNumberTextField.text?.isEmpty)! {
            
            saveButton.isUserInteractionEnabled = false
        }

    }
    
    // UIPickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        } else {
            return minutes.count
        }
    }
    
    // UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hours[row]
        } else {
            return minutes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if startTextField.isFirstResponder {
            startTextField.text = "\(hours[customTimePicker.selectedRow(inComponent: 0)]) : \(minutes[customTimePicker.selectedRow(inComponent: 1)])"
            
        } else {
            finishTextField.text = "\(hours[customTimePicker.selectedRow(inComponent: 0)]) : \(minutes[customTimePicker.selectedRow(inComponent: 1)])"
        }
    }
    
    // Change the background color of startLabel on touchDown, set customPickerView background color
    
    func didTouchDownStartTextField(textField: UITextField) {
        print("touchDown occurred")
        let swiftColor = UIColor(red: 0, green: 125/255, blue: 1.0, alpha: 1.0)
        startLabel.backgroundColor = swiftColor
        startLabel.textColor = UIColor.white
        
        finishLabel.backgroundColor = UIColor.white
        finishLabel.textColor = UIColor.black
        
        customTimePicker.backgroundColor = UIColor.lightGray
    }
    
    // Change the background color of finishLabel on touchDown
    func didTouchDownFinishTextField(textField: UITextField) {
        print("touchDown occurred")
        let swiftColor = UIColor(red: 0, green: 125/255, blue: 1.0, alpha: 1.0)
        finishLabel.backgroundColor = swiftColor
        finishLabel.textColor = UIColor.white
        
        startLabel.backgroundColor = UIColor.white
        startLabel.textColor = UIColor.black
    }
    
    // Dismiss customPickerView on tap anywhere on the view
    func hideCustomTimePicker() {
        view.endEditing(true)
        startLabel.backgroundColor = UIColor.white
        startLabel.textColor = UIColor.black
        
        finishLabel.backgroundColor = UIColor.white
        finishLabel.textColor = UIColor.black
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isUserInteractionEnabled = true
        saveButton.backgroundColor = UIColor(red: 0, green: 125/255, blue: 1.0, alpha: 1.0)
        saveButton.setTitleColor(.white, for: UIControlState.normal)
    }


    @IBAction func saveButtonTapped(_ sender: Any) {
        
        switch senderVCIdentifier {
            
        case "Day1ViewController":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day1TimeTableInfo = Day1TimeTableInfo(context: context)
            day1TimeTableInfo.startTime = startTextField.text
            day1TimeTableInfo.finishTime = finishTextField.text
            day1TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day1TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(senderVCIdentifier)
            
        case "Day2ViewController":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day2TimeTableInfo = Day2TimeTableInfo(context: context)
            day2TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day2TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(senderVCIdentifier)
            
        case "Day3ViewController":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day3TimeTableInfo = Day3TimeTableInfo(context: context)
            day3TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day3TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(senderVCIdentifier)
            
        case "Day4ViewController":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day4TimeTableInfo = Day4TimeTableInfo(context: context)
            day4TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day4TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(senderVCIdentifier)
            
        case "Day5ViewController":
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let day5TimeTableInfo = Day5TimeTableInfo(context: context)
            day5TimeTableInfo.teachingGroupName = teachingGroupTextField.text
            day5TimeTableInfo.classroomNumber = classroomNumberTextField.text
            
            //Save the data to core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            print(senderVCIdentifier)
            
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
