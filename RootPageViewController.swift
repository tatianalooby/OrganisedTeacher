//
//  RootPageViewController.swift
//  OrganisedTeacher
//
//  Created by Tatiana Looby on 27/01/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    //May be can be deleted from here
    lazy var viewControllersList: [UIViewController] = {
        
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let day1VC = myStoryBoard.instantiateViewController(withIdentifier: "Day1ViewController")
        let day2VC = myStoryBoard.instantiateViewController(withIdentifier: "Day2ViewController")
        
        return [day1VC, day2VC]
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstViewController = viewControllersList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
