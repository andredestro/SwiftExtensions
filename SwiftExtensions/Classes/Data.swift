//
//  Data.swift
//  Extensions
//
//  Created by André Felipe Destro on 08/05/18.
//

extension Data {
    
    var hexDescription: String {
        return reduce("") { $0 + String(format: "%02x", $1) }
    }
}
