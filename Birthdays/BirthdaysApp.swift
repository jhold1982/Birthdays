//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Justin Hold on 4/25/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: Friend.self)
        }
    }
}
