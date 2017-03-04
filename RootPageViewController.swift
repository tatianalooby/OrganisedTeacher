//
//  RootPageViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var arrayIndex: Int?
    var senderVCIndex: Int!
    
    lazy var dayViewControllers: [DayViewController] = {
        
        return [
            self.setUpDayViewController(index: 0),
            self.setUpDayViewController(index: 1),
            self.setUpDayViewController(index: 2),
            self.setUpDayViewController(index: 3),
            self.setUpDayViewController(index: 4)
        ]
    }()
    
    func setUpDayViewController (index: Int) -> DayViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DayViewController") as! DayViewController
        viewController.dayIndex = index
        print(index)
        //viewController.day1TableView.backgroundColor = color
        
        
        return viewController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        self.navigationItem.title = "Monday"
        self.navigationController!.navigationBar.isTranslucent = false
        
        senderVCIndex = 0
        
        
        print("viewDidLoad")
        if let firstViewController = dayViewControllers.first {
            
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            print("check1")
            print(dayViewControllers)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = dayViewControllers.index(of: viewController as! DayViewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard dayViewControllers.count > previousIndex else {
            return nil
        }
        
        return dayViewControllers[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = dayViewControllers.index(of: viewController as! DayViewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let dayViewControllersCount = dayViewControllers.count
        
        guard dayViewControllersCount != nextIndex else {
            return nil
        }
        
        guard dayViewControllersCount > nextIndex else {
            return nil
        }
        
        return dayViewControllers[nextIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RooPageVCToAddUserInfoVC" {
            let controller = segue.destination as! AddUserInfoViewController
            controller.senderVCIndex = senderVCIndex
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if (!completed) {
            print("no change")
            return
        }
        
        if let firstViewController = viewControllers?.first {
            
            arrayIndex = dayViewControllers.index(of: firstViewController as! DayViewController)
            if let index = arrayIndex {
                switch index {
                case 0:
                    self.navigationController!.navigationBar.topItem!.title = "Monday"
                    //senderVCIdentifier = String(describing: viewControllersList[arrayIndex])
                    //print(senderVCIdentifier)
                    senderVCIndex = index
                    print(senderVCIndex)
                    break
                    
                case 1:
                    self.navigationController!.navigationBar.topItem!.title = "Tuesday"
                    //senderVCIdentifier = String(describing: viewControllersList[arrayIndex])
                    //print(senderVCIdentifier)
                    senderVCIndex = index
                    break
                    
                case 2:
                    self.navigationController!.navigationBar.topItem!.title = "Wednesday"
                    //senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                    //print(senderVCIdentifier)
                    senderVCIndex = index
                    break
                    
                case 3:
                    self.navigationController!.navigationBar.topItem!.title = "Thursday"
                    //senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                    //print(senderVCIdentifier)
                    senderVCIndex = index
                    break
                    
                case 4:
                    self.navigationController!.navigationBar.topItem!.title = "Friday"
                    //senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                    //print(senderVCIdentifier)
                    senderVCIndex = index
                    break
                    
                default:
                    self.navigationController!.navigationBar.topItem!.title = "Timetable"
                    
                }
            }
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    // Set up UINavigationControllerDelegate methods
    //    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
    //
    //        viewController.viewWillAppear(true)
    //    }
    //
    //    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool){
    //
    //        viewController.viewDidAppear(true)
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
