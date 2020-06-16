//
//  ShowService.swift
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//


import Foundation

protocol ShowService {

    func fetchShows(date: String, completion: @escaping (Result<[TVShow], ServiceLayerClient.ServiceError>) -> Void)
    
    func getCast(showId: Int, completion: @escaping (Result<[Cast], ServiceLayerClient.ServiceError>) -> Void)
}

extension ServiceLayerClient: ShowService {
    
    func getCast(showId: Int, completion: @escaping (Result<[Cast], ServiceError>) -> Void) {
        
        createDataTask(path: Endpoint.getCast(showId: showId).path, parameter: EmptyParameter()) { result in
            completion(result)
        }
    }
    
    
    func fetchShows(date: String, completion: @escaping (Result<[TVShow], ServiceError>) -> Void) {
        let scheduleDate = ScheduleDateEncodable(date: date)
        createDataTask(path: Endpoint.fetchSchedule.path, parameter: scheduleDate) { result in
            completion(result)
        }
    }
}
