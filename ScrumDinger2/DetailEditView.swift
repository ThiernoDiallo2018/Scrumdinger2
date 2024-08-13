//
//  DetailEditView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/11/24.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var scrum = DailyScrum.emptyScrum
    
    @State private var newAttendeeName = "" //We will be putting new Attendee names in this variable the user enters
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Information")) {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lengthInMinutesDoubles, in: 5...40, step: 1) {
                        Text("Length") //Doesnt appear - for accessibility reasons
                    }
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices) // Can delete names at their current index using the on delete closure
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName) //Keeps us in sync with the datat put in the variable above
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                            
                            //Pushing the data into the array and then resetting it back to empty
                        }
                        
                    }) {
                        Image(systemName: "button.programmable")
                    }
                    .disabled(newAttendeeName.isEmpty)

                }
                
            }
        }
        
    }
}

#Preview {
    DetailEditView()
}
