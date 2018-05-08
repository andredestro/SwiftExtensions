//
//  String.swift
//  Extensions
//
//  Created by André Felipe Destro on 29/07/16.
//  Copyright (c) 2016 André Felipe Destro. All rights reserved.
//

import Foundation

public extension String {
    
    var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var swapCases: String {
        var result = ""
        for char in self {
            result += String(char) == String(char).lowercased() ? String(char).uppercased() : String(char).lowercased()
        }
        return result
    }
    
    var localizedString : String {
        return NSLocalizedString(self, value: "", comment: "")
    }
    
    var urlQueryEncode: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}
