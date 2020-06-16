//
//  ScheduleDateEncodable.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-15.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

//Just a marker to indicate there's no parameter and act as a default
struct EmptyParameter: Encodable {
}

struct ScheduleDateEncodable: Encodable {
    let date: String
}
