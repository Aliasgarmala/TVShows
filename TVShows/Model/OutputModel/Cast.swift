//
//  Cast.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-14.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

struct Cast: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case person
    }
    
    enum PersonCodingKeys: String, CodingKey {
        case name
    }
}

extension Cast {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let people =  try container.decode(Person.self, forKey: .person)
        name = people.name
    }
}

struct Person: Decodable {
    let name: String
}
