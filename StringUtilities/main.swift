//
//  main.swift
//  StringUtilities
//
//  Created by Joe Farrell on 9/25/18.
//  Copyright © 2018 Joe Farrell. All rights reserved.
//

import Foundation

print("Hello, World!")

extension String {
    func index(of: String) -> Int {
        var index = 0
        
        for char in self {
            if of != "" && Character(String(of.prefix(1))) == char {
                let ln = of.count + index
                
                if self[index..<ln] == of {
                    return index
                }
            }
            
            index += 1
        }
        
        return -1
    }
    
    subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        
        return String(self[start...end])
    }
    
    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end: String.Index
        
        if bounds.upperBound > distance(from: startIndex, to:endIndex) {
            end = endIndex
        } else {
            end = index(startIndex, offsetBy: bounds.upperBound)
        }
        
        return String(self[start..<end])
    }
}
