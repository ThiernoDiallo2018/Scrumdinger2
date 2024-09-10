//
//  DetailEditView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/11/24.
//

import SwiftUI

/*
 Clearly shares a source of truth with Detail View Screen so we are connecting it with this screen so they have a binding relationship. Every time one updates, so will the other. Anything that is updated in this edit view, should reflect on the detail screen, so we will use @Binding
 */

struct DetailEditView: View {
    
    @Binding var scrum: DailyScrum //it is init with Dailyscrum so can't be private since need to access data from other file
    
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
                    
                    ThemePicker(selection: $scrum.theme)
                    
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

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
