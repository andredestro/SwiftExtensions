//
//  NSNotificationCenter.swift
//  Extensions
//
//  Created by André Felipe Destro on 01/08/16.
//  Copyright (c) 2016 André Felipe Destro. All rights reserved.
//

import UIKit

public extension NotificationCenter {
    
    class func postNotificationName(_ name: String) {
        `default`.post(name: Notification.Name(rawValue: name), object: nil)
    }
    
    class func postNotificationName(_ name: String, userInfo: [AnyHashable: Any]?) {
        `default`.post(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
    }
}
