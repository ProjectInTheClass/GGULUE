//
//  PageViewController.swift
//  GGULUE
//
//  Created by Eujeong's MacBook Pro on 2018. 8. 13..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "LectureListStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RadarChartViewController") as! RadarChartViewController,
            UIStoryboard(name: "LectureListStoryboard", bundle: nil).instantiateViewController(withIdentifier: "WordCloudController") as! WordCloudController
        ]
    }()
    var selectedLecture : Lecture? {
        didSet{
            print(selectedLecture)
            let radarchartVC = subViewControllers[0] as! RadarChartViewController
            radarchartVC.selectedLecture = selectedLecture
            let WCVC = subViewControllers[1] as! WordCloudController
            WCVC.selectedLecture = selectedLecture
        }
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex : Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex == 1{
            return subViewControllers[0]
        }
        return subViewControllers[currentIndex+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex : Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex == 0{
            return subViewControllers[1]
        }
        return subViewControllers[currentIndex-1]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    

}
