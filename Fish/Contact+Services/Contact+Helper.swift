//
//  Contact+Helper.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import Foundation

extension Contact {
    
    var firstName: String {
        get {
            return firstName_ ?? ""
        }
        set {
            firstName_ = newValue
        }
    }
    
}
