//
//  PageVC.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit


class PageVC: UIPageViewController {
    var currentPage = 0
    var locationsArray = ["Local City Weather", "Sydney, Austrialia", "Accra, Ghana", "Uglich, Russia"]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)
    }
    
    func createDetailVC(forPage page: Int) -> DetailVC1 {
        currentPage = min(max(0, page), locationsArray.count - 1)
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC1") as! DetailVC1
        detailVC.locationsArray = locationsArray
        detailVC.currentPage = currentPage
        
        return detailVC
    }
    

    

}


extension PageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC1 {
            if currentViewController.currentPage < locationsArray.count - 1 {
                return createDetailVC(forPage: currentViewController.currentPage + 1)
            }
        }
    return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC1 {
            if currentViewController.currentPage > 0 {
                return createDetailVC(forPage: currentViewController.currentPage - 1)
            }
        }
    return nil
    }
    

    
}
