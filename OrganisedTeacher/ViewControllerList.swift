//
//  viewControllersList.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

var viewControllersList: [UIViewController] = {
    
    let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    
    let day1VC = myStoryBoard.instantiateViewController(withIdentifier: "Day1ViewController")
    let day2VC = myStoryBoard.instantiateViewController(withIdentifier: "Day2ViewController")
    let day3VC = myStoryBoard.instantiateViewController(withIdentifier: "Day3ViewController")
    let day4VC = myStoryBoard.instantiateViewController(withIdentifier: "Day4ViewController")
    let day5VC = myStoryBoard.instantiateViewController(withIdentifier: "Day5ViewController")

    return [day1VC, day2VC, day3VC, day4VC, day5VC]
    
}()



