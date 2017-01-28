//
//  Day1ViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class Day1ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Day1VCToAddUserInfoVC" {
            let controller = segue.destination as! AddUserInfoViewController
            controller.connectingSegueID = "Day1VCToAddUserInfoVC"
        }
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func goToSideMenu(segue: UIStoryboardSegue) {
        
        print("Called goToSideMenu: unwind action")
        
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
