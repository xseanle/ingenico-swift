//
//  Extensions.swift
//  IngenicoConnectKit
//
//  Created for Ingenico ePayments on 15/12/2016.
//  Copyright © 2016 Global Collect Services. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    public func base64URLDecode() -> Data {
        let underscoreReplaced = self.replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let modulo = self.length % 4
        var paddingAdded = underscoreReplaced
        
        if modulo == 2 {
            paddingAdded += "=="
        } else if modulo == 3 {
            paddingAdded += "="
        }
        
        return self.decode(paddingAdded)
    }
    
    public func decode(_ string: String? = nil) -> Data {
        if let str = string {
            return Data(base64Encoded: str)!
        }
        return Data(base64Encoded: self)!
    }
    
}
