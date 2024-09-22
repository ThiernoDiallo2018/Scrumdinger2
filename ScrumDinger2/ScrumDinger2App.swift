//
//  ScrumDinger2App.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/20/24.
//

import SwiftUI

//Root view of the app --- Up to making scrums identifiable 2/3

/*
 Scene Arc: You have the protocol App, then utilizing scenes which are containers for a view hierarchy that your app presents. Scenes have transition phases from active, inactive and background
 
 WindowGroup is one of the primitive scenes that SwiftUI provides. In iOS, the views you add to the WindowGroup scene builder are presented in a window that fills the device’s entire screen. It is the rootview of the app. Can pass down the truth of the data into the View hierarchy from this point
 
 
 
 
 */

@main
struct ScrumDinger2App: App { //App Protocol
    
    @State private var scrum = DailyScrum.sampleData //Source of truth that many of the app is using. Holds the array of Scrums via the extension. 
    
    var body: some Scene { //Scene Protocol
        WindowGroup { //Front Door to the app - Open it and shows everything beginning with the first scene which is the ScrumsView()
            ScrumsView(scrums: $scrum) //RootView //Binding the truth through scrumsview
        }
    }
}
