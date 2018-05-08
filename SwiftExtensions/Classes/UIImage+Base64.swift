//
//  UIImage.swift
//  Pods-SwiftExtensions_Tests
//
//  Created by André Felipe Destro on 08/05/18.
//

import Foundation

public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    
    convenience init?(base64String: String) {
        let temp = base64String.components(separatedBy: ",")
        let dataDecoded : Data = Data(base64Encoded: temp[1], options: .ignoreUnknownCharacters)!
        self.init(data: dataDecoded)
    }
    
    public func base64(format: ImageFormat) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = UIImagePNGRepresentation(self)
        case .jpeg(let compression): imageData = UIImageJPEGRepresentation(self, compression)
        }
        return imageData?.base64EncodedString()
    }
}
