//
//  Destination.swift
//  iTour
//
//  Created by Vincent Senjaya on 19/06/24.
//

import Foundation
import SwiftData


@Model
class Destination{
    var name: String
    var details: String
    var date: Date
    var priority: Int
    var sights = [Sight]()
    
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
