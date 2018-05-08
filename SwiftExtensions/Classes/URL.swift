//
//  NSURL.swift
//  Extensions
//
//  Created by André Felipe Destro on 29/07/16.
//  Copyright (c) 2016 André Felipe Destro. All rights reserved.
//

import UIKit

public extension URL {

    func applicationCanOpenURL() -> Bool {
        return UIApplication.shared.canOpenURL(self)
    }
}
