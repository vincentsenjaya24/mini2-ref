//
//  iTourApp.swift
//  iTour
//
//  Created by Vincent Senjaya on 19/06/24.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
