//
//  Date.swift
//  Extensions
//
//  Created by André Felipe Destro on 08/05/18.
//

import UIKit

extension Date {

    var daysUntilNow: Int {
        let interval = Date().timeIntervalSince(self)
        let days: Int = Int(interval) / kDaySeconds
        return days
    }
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        return end - start
    }
}
