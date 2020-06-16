//
//  TVShowsSetup.swift
//  TVShowsSetup
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
//Entry point of the application where all initialization should be done
struct TVShowsSetup {
    let viewControllerFactory: ViewControllerFactory
    
    init() {
        let service = ServiceLayerClient()
        self.viewControllerFactory = ViewControllerFactory(service: service)
    }
}
