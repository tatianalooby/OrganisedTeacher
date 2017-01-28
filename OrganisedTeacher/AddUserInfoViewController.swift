//
//  AddUserInfoViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class AddUserInfoViewController: UIViewController {
    
    var connectingSegueID: String = ""
    
    @IBOutlet weak var teachingGroupTextField: UITextField!
    @IBOutlet weak var classroomNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        switch connectingSegueID {
        case "Day1VCToAddUserInfoVC":
            print(connectingSegueID)
        case "Day2VCToAddUserInfoVC":
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
