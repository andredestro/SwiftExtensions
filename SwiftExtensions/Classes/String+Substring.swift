//
//  String+Substring.swift
//  Extensions
//
//  Created by André Felipe Destro on 08/05/18.
//

public extension String {

    subscript (index: Int) -> Character {
        var i = index
        if i < 0 {
            i = self.count - abs(index)
        }
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    func substring(_ startIndexx: Int, length: Int) -> String {
        let start = index(startIndex, offsetBy: startIndexx)
        let end = index(startIndex, offsetBy: startIndexx + length)
        return String(self[start..<end])
    }
    
    func substring(_ startIndexx: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: startIndexx)
        let end = index(startIndex, offsetBy: to)
        return String(self[start..<end])
    }
}
