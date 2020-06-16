//
//  Endpoint.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation


enum Endpoint {
    case baseURL
    case fetchSchedule
    case getCast(showId: Int)
    
    var path: String {
        
        switch self {
        case .baseURL:
            return "https://api.tvmaze.com/"
        case .fetchSchedule:
            return "schedule"
        case .getCast(let showId):
            return "shows/\(showId)/cast"
        }
    }

}
