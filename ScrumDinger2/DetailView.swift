//
//  DetailView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/10/24.
//

import SwiftUI


/*
 Detail View will have the name of a scrum, meeting, duration, card color and attendee list
 */


struct DetailView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Information")) {
                NavigationLink(destination: MeetingView()) { //transition to the meeting screen
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                    
                }
            }
        }
        .navigationTitle("\(scrum.title)")
    
        
    }
}


#Preview {
    
    NavigationStack {
        
        DetailView(scrum: DailyScrum.sampleData[0])
    }
}
