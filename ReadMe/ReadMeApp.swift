//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by Dominic Swaine on 26/06/2021.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Library())
        }
    }
}
