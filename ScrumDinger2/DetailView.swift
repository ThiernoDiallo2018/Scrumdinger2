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
    
    @Binding var scrum: DailyScrum // Using a binding ensures that DetailView renders again when the user’s interaction modifies scrum.
    
    @State private var editingScrum = DailyScrum.emptyScrum // You’ll update this empty scrum to match the selected scrum when the user taps the Edit button via the DetailEditingView - Changes that a user makes to scrum in the edit view are shared with the editingScrum property in the detail view and passed down
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Information")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) { //transition to the meeting screen
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
            
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
             Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                    
                ForEach(scrum.history) { history in 
                        HStack {
                            Image(systemName: "calendar.badge.checkmark.rtl")
                            Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false

                                scrum = editingScrum
                                
                                
                            }
                            
                        }
                    }

            }
        }
        //Sheet will present a modal. Modal views remove users from the main navigation flow of the app. Use modality for short, self-contained tasks
    }
}


#Preview {
    
    NavigationStack {
        
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
