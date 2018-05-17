//
//  NSDate.swift
//  Extensions
//
//  Created by André Felipe Destro on 29/07/16.
//  Copyright (c) 2016 André Felipe Destro. All rights reserved.
//

import Foundation

let kMinute = 60
let kHour = kMinute * 60
let kDaySeconds = kHour * 24
let kDayMinutes = kMinute * 24
let kWeek = kDayMinutes * 7
let kMonth = kDayMinutes * 31
let kYear = kDayMinutes * 365

public extension Date {
    
    var timeAgoSimple: String {
        let now = Date()
        let deltaSeconds = Int(fabs(timeIntervalSince(now)))
        let deltaMinutes = deltaSeconds / 60
        var value: Int!
        
        if deltaSeconds < kMinute { // Seconds
            return stringFromFormat("%%d%@s", withValue: deltaSeconds)
        } else if deltaMinutes < kMinute { // Minutes
            return stringFromFormat("%%d%@m", withValue: deltaMinutes)
        } else if deltaMinutes < kDayMinutes { // Hours
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return stringFromFormat("%%d%@h", withValue: value)
        } else if deltaMinutes < kWeek { // Days
            value = Int(floor(Float(deltaMinutes / kDayMinutes)))
            return stringFromFormat("%%d%@d", withValue: value)
        } else if deltaMinutes < kMonth { // Weeks
            value = Int(floor(Float(deltaMinutes / kWeek)))
            return stringFromFormat("%%d%@w", withValue: value)
        } else if deltaMinutes < kYear { // Month
            value = Int(floor(Float(deltaMinutes / kMonth)))
            return stringFromFormat("%%d%@mo", withValue: value)
        } else { // Years
            value = Int(floor(Float(deltaMinutes / kYear)))
            return stringFromFormat("%%d%@yr", withValue: value)
        }
    }
    
    var timeAgo: String {
        let now = Date()
        let deltaSeconds = Int(fabs(timeIntervalSince(now)))
        let deltaMinutes = deltaSeconds / 60
        var value: Int!
        
        if deltaSeconds < 5 { // Just Now
            return NSDateTimeAgoLocalizedStrings("Just now")
        } else if deltaSeconds < kMinute { // Seconds Ago
            return stringFromFormat("%%d %@seconds ago", withValue: deltaSeconds)
        } else if deltaSeconds < 120 { // A Minute Ago
            return NSDateTimeAgoLocalizedStrings("A minute ago")
        } else if deltaMinutes < kMinute { // Minutes Ago
            return stringFromFormat("%%d %@minutes ago", withValue: deltaMinutes)
        } else if deltaMinutes < 120 { // An Hour Ago
            return NSDateTimeAgoLocalizedStrings("An hour ago")
        } else if deltaMinutes < kDayMinutes { // Hours Ago
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return stringFromFormat("%%d %@hours ago", withValue: value)
        } else if deltaMinutes < (kDayMinutes * 2) { // Yesterday
            return NSDateTimeAgoLocalizedStrings("Yesterday")
        } else if deltaMinutes < kWeek { // Days Ago
            value = Int(floor(Float(deltaMinutes / kDayMinutes)))
            return stringFromFormat("%%d %@days ago", withValue: value)
        } else if deltaMinutes < (kWeek * 2) { // Last Week
            return NSDateTimeAgoLocalizedStrings("Last week")
        } else if deltaMinutes < kMonth { // Weeks Ago
            value = Int(floor(Float(deltaMinutes / kWeek)))
            return stringFromFormat("%%d %@weeks ago", withValue: value)
        } else if deltaMinutes < (kDayMinutes * 61) { // Last month
            return NSDateTimeAgoLocalizedStrings("Last month")
        } else if deltaMinutes < kYear { // Month Ago
            value = Int(floor(Float(deltaMinutes / kMonth)))
            return stringFromFormat("%%d %@months ago", withValue: value)
        } else if deltaMinutes < (kDayMinutes * (kYear * 2)) { // Last Year
            return NSDateTimeAgoLocalizedStrings("Last Year")
        } else { // Years Ago
            value = Int(floor(Float(deltaMinutes / kYear)))
            return stringFromFormat("%%d %@years ago", withValue: value)
        }
    }
    
    func stringFromFormat(_ format: String, withValue value: Int) -> String {
        let localeFormat = String(format: format, getLocaleFormatUnderscoresWithValue(Double(value)))
        let localizedString = NSDateTimeAgoLocalizedStrings(localeFormat)
        return String(format: localizedString, value)
    }
    
    func getLocaleFormatUnderscoresWithValue(_ value: Double) -> String {
        let localeCode = Locale.preferredLanguages.first as String?
        if localeCode == "ru" {
            let XY = Int(floor(value)) % 100
            let Y = Int(floor(value)) % 10
            
            if Y == 0 || Y > 4 || (XY > 10 && XY < 15) {
                return ""
            }
            
            if Y > 1 && Y < 5 && (XY < 10 || XY > 20) {
                return "_"
            }
            
            if Y == 1 && XY != 11 {
                return "__"
            }
        }
        
        return ""
    }
    
    fileprivate func NSDateTimeAgoLocalizedStrings(_ key: String) -> String {
        return NSLocalizedString(key, tableName: "NSDateTimeAgo", bundle: Bundle.main, comment: "")
    }
}
