//
//  SettingsDefaults.swift
//  RideApp
//
//  Created by Christopher Conner on 6/20/20.
//  Copyright © 2020 Christopher Conner. All rights reserved.
//

import Foundation

@propertyWrapper
struct SettingsDefault<T> {
    let key: String
    let defaultValue: T
    
    init (_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

