//
//  PageViewController.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-14.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import UIKit
//reference: https://www.linkedin.com/pulse/using-ios-pageviewcontroller-without-storyboards-paul-tangen/
class PageViewController: UIPageViewController {
    private let viewControllerFactory: ViewControllerFactory
    private var pages: [UIViewController] = []
    private let pageControl = UIPageControl()

    init(viewControllerFactory: ViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeSplitView() {
        let monday = viewControllerFactory.mondayViewController()
        let tuesday = viewControllerFactory.tuesdayViewController()
        let wednesday = viewControllerFactory.wednesdayViewController()
        let thursday = viewControllerFactory.thursdayViewController()
        let friday = viewControllerFactory.fridayViewController()
        let saturday = viewControllerFactory.saturdayViewController()
        let sunday = viewControllerFactory.sundayViewController()
        
        pages.append(contentsOf: [monday, tuesday, wednesday, thursday, friday, saturday, sunday])
        
        setViewControllers([monday], direction: .forward, animated: true)
    }
    
    fileprivate func setPageControl() {
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        initializeSplitView()
        setPageControl()
    }
}

//MARK: DATASOURCE AND DELEGATE
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = pages.firstIndex(of: viewControllers[0]) {
                pageControl.currentPage = viewControllerIndex
            }
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return pages.last
            } else {
                // go to previous page in array
                return pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = pages.firstIndex(of: viewController) {
            if viewControllerIndex < pages.count - 1 {
                // go to next page in array
                return pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return pages.first
            }
        }
        return nil
    }
}
