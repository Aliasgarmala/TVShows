//
//  Schedule.swift
//  TVShows
//
//  Created by Aliasgar Mala on 2020-06-12.
//  Copyright © 2020 Aliasgar Mala. All rights reserved.
//

import Foundation
//singleton to calculate current week to display
struct ScheduleDate {
    
    static let shared = ScheduleDate()
    
    private var dict: [String: String] = [:]
    private let formatterDay = DateFormatter()
    private let formatterDate = DateFormatter()

    func getDateOf( day: Day) -> String {
        return dict[day.rawValue]!
    }
   
    private init() {

        formatterDate.dateFormat = "EEEE"
        formatterDay.dateFormat = "YYYY-MM-dd"
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
        let dateOfWeek = days.map{formatterDay.string(from: $0)}
        
        for index in 0..<days.count {
            dict[formatterDate.string(from: days[index])] = dateOfWeek[index]
        }
    }
}



