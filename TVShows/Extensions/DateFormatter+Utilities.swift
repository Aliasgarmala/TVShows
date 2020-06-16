//
//  DateFormatter+Utilities.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-15.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation

//creating static date formatter as initializing date formatter is expensive
extension DateFormatter {
    static let twentyFourHourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static let twelveHourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    
    static let standardDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
    
    static let mediumDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}
