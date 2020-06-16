//
//  TVShow.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-11.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

struct TVShow: Decodable {
    let name: String
    let season: Int
    let number: Int?
    let airdate, airtime: String
    let runtime: Int?
    let show: Show
}

struct Show: Decodable {
    let id: Int
    let genres: [String]
    let network: Network?
    let image: Image?
    let summary: String?
}

// MARK: - Image
struct Image: Decodable {
    let medium, original: String
}

// MARK: - Network
struct Network: Decodable {
    let id: Int
    let name: String
}
