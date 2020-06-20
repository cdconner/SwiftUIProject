//
//  SettingsManager.swift
//  RideApp
//
//  Created by Christopher Conner on 6/20/20.
//  Copyright © 2020 Christopher Conner. All rights reserved.
//

import Foundation
import Combine

class SettingsManager: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @SettingsDefault("travelRadius", defaultValue: 300)
    var travelRadius: Double {
        willSet {
            objectWillChange.send()
        }
    }
    
}
