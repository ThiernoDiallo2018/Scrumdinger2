//
//  ScrumDinger2App.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/20/24.
//

import SwiftUI

//Root view of the app --- Up to making scrums identifiable 2/3

/*
 WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen.
 
 */

@main
struct ScrumDinger2App: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
