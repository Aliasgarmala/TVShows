//
//  ViewControllerFactory.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation


import UIKit


class ViewControllerFactory {
    
    private let service: ServiceLayerClient
    
    init(service: ServiceLayerClient) {
        self.service = service
    }
    
    func pageViewController() -> UIViewController {
        return PageViewController(viewControllerFactory: self)
    }
    
    func mondayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .monday)
        let mondayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [mondayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func tuesdayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .tuesday)
        let tuesdayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [tuesdayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func wednesdayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .wednesday)
        let wednesdayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [wednesdayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func thursdayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .thursday)
        let thursdayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [thursdayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func fridayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .friday)
        let fridayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [fridayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func saturdayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .saturday)
        let saturdayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [saturdayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func sundayViewController() -> UIViewController {
        let viewModel = MainViewModel(showService: service, imageService: service, day: .sunday)
        let sundayNavigationController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel, viewControllerFactory: self))
        let splitViewController =  UISplitViewController()
        splitViewController.viewControllers = [sundayNavigationController]
        splitViewController.preferredDisplayMode = .allVisible
        return splitViewController
    }
    
    func detailViewController(tvShow: TVShow) -> UIViewController {
        let detailViewModel = DetailViewModel(tvShow: tvShow, imageService: service, showService: service)
        return DetailViewController(viewModel: detailViewModel)
    }
}
