//
//  ContentView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/20/24.
//

import SwiftUI

//Declarative - using SwiftUI, everything is made up of views on top of views
//To customize views, we are going to use modifiers. You definitely remember this

/*
 
 Creating a color theme - choose two contrasting colors. One for the background and the second for the text
 
 We have rehashed on Views, Modifiers, Stacks, Accessibility...
 
 Everything is a view. Remember that!!
 
 
 */

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Time Elapsed")
                        .font(.caption)
                    Label(
                        title: { Text("200") },
                        icon: { Image(systemName: "hourglass.tophalf.fill") }
                    )
                }
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore) //Can ignore the builtin accessibility of the child views and add your own below
            .accessibilityLabel("Time Remaining") //when people using VO hear it, we have simplified it down to Time remaining so they understand easier and quicker
            .accessibilityValue("10 Minutes") //Need to add value or SwiftUI will automatically infer from the child views
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker") //Will read the button as "Next Speaker. Button"
            }
            
        }
        .padding()
        
    }
}

#Preview {
    MeetingView()
}
