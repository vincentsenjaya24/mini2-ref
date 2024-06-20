//
//  Sight.swift
//  iTour
//
//  Created by Vincent Senjaya on 20/06/24.
//

import Foundation
import SwiftData

@Model
class Sight{
    var name: String

    init(name: String = "captain") {
        self.name = name
    }
}
