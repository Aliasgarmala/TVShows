//
//  ShowServiceMock.swift
//  TVShowsTests
//
//  Created by Aliasgar Mala on 2020-06-15.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
@testable import TVShows

class ShowServiceMock: ShowService {
   
    let showResponse: Result<[TVShow], ServiceLayerClient.ServiceError> = Result.success([TVShow(name: "Friends", season: 5, number: 16, airdate: "2020-06-15", airtime: "21.00", runtime: 30, show: Show(id: 1, genres: ["comedy"], network: Network(id: 1, name: "Plex"), image: nil, summary: "Best show ever"))])
    
    let castResponse: Result<[Cast], ServiceLayerClient.ServiceError> = Result.success([Cast(name: "Racheal"), Cast(name: "Ross")])
    
    func fetchShows(date: String, completion: @escaping (Result<[TVShow], ServiceLayerClient.ServiceError>) -> Void) {
         completion(showResponse)
    }
    
    func getCast(showId: Int, completion: @escaping (Result<[Cast], ServiceLayerClient.ServiceError>) -> Void) {
        completion(castResponse)
    }
}
