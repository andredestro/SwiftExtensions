//
//  Date+Components.swift
//  Extensions
//
//  Created by André Felipe Destro on 08/05/18.
//

import Foundation

public extension Date {

    var calendarComponents: DateComponents {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.second, .minute, .hour, .day, .weekday, .month, .weekOfMonth, .weekOfYear, .year, .era, .nanosecond, .quarter, .timeZone, .weekdayOrdinal, .yearForWeekOfYear], from: self)
    }
    
    var second: Int {
        return calendarComponents.second!
    }
    
    var minute: Int {
        return calendarComponents.minute!
    }
    
    var hour: Int {
        return calendarComponents.hour!
    }
    
    var day: Int {
        return calendarComponents.day!
    }
    
    var weekday: Int {
        return calendarComponents.weekday!
    }
    
    var month: Int {
        return calendarComponents.month!
    }
    
    var weekOfMonth: Int {
        return calendarComponents.weekOfMonth!
    }
    
    var weekOfYear: Int {
        return calendarComponents.weekOfYear!
    }
    
    var year: Int {
        return calendarComponents.year!
    }
    
    var era: Int {
        return calendarComponents.era!
    }
    
    var nanosecond: Int {
        return calendarComponents.era!
    }
    
    var quarter: Int {
        return calendarComponents.quarter!
    }
    
    var timeZone: TimeZone? {
        return (calendarComponents as NSDateComponents).timeZone
    }
    
    var weekdayOrdinal: Int {
        return calendarComponents.weekdayOrdinal!
    }
    
    var yearForWeekOfYear: Int {
        return calendarComponents.yearForWeekOfYear!
    }
}
