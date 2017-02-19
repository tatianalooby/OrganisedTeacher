//
//  RootPageViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var senderVCIdentifier = ""

    
    //May be can be deleted from here
//    lazy var viewControllersList: [UIViewController] = {
//        
//        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let day1VC = myStoryBoard.instantiateViewController(withIdentifier: "Day1ViewController")
//        let day2VC = myStoryBoard.instantiateViewController(withIdentifier: "Day2ViewController")
//        
//        return [day1VC, day2VC]
//        
//    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        self.navigationItem.title = "Monday"
        self.navigationController!.navigationBar.isTranslucent = false
        
        senderVCIdentifier = "Day1ViewController"
        
        if let firstViewController = viewControllersList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            print("check1")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllersList.index(of: viewController) else { return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard viewControllersList.count > 0 else {return nil }
        return viewControllersList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllersList.index(of: viewController) else { return
            nil}
        let nextIndex = viewControllerIndex + 1
        guard viewControllersList.count != nextIndex else {return nil}
        guard viewControllersList.count > nextIndex else {return nil}
        return viewControllersList[nextIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RooPageVCToAddUserInfoVC" {
            let controller = segue.destination as! AddUserInfoViewController
            controller.senderVCIdentifier = senderVCIdentifier
        }
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if (!completed) {
            print("no change")
            return
        }
        
        if let firstViewController = viewControllers?.first,
            let arrayIndex = viewControllersList.index(of: firstViewController) {
            //print(firstViewController)
            switch arrayIndex {
            case 0:
                self.navigationController!.navigationBar.topItem!.title = "Monday"
                senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                print(senderVCIdentifier)

                //self.navigationController!.navigationBar.topItem!.set =
                break
                
            case 1:
                self.navigationController!.navigationBar.topItem!.title = "Tuesday"
                senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                print(senderVCIdentifier)
                break
                
            case 2:
                self.navigationController!.navigationBar.topItem!.title = "Wednesday"
                senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                print(senderVCIdentifier)
                break

            case 3:
                self.navigationController!.navigationBar.topItem!.title = "Thursday"
                senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                print(senderVCIdentifier)
                break

            case 4:
                self.navigationController!.navigationBar.topItem!.title = "Friday"
                senderVCIdentifier = viewControllersList[arrayIndex].restorationIdentifier!
                print(senderVCIdentifier)
                break
//
//            case 5:
//                self.navigationController!.navigationBar.topItem!.title = "Saturday"
//                break
//                
//            case 6:
//                self.navigationController!.navigationBar.topItem!.title = "Sunday"
//                break
                
            default:
                self.navigationController!.navigationBar.topItem!.title = "Timetable"
                
                
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
