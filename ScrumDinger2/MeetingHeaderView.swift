//
//  MeetingHeaderView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 9/21/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    
    let secondsElapsed: Int // Using dynamic properties now instead of conservative
    let secondsRemaining: Int
    let theme: Theme // bringing in theme model to eventually use
    
   private var totalSeconds: Int { // Only this view can access this property
    
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
            guard totalSeconds > 0 else { return 1 } //if it is true true, it will calculate the progress . If not true, it will execute the guard
            return Double(secondsElapsed) / Double(totalSeconds)
        }
    
    private var minutesRemaining: Int {
           secondsRemaining / 60
       }
    
    
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))

            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label(
                        title: {  Text("\(secondsElapsed)") },
                        icon: { Image(systemName: "hourglass.tophalf.fill") }
                    ) // same as the label before but passed through a closure so can use more custom views within
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon) //pushes the icon to the back
                }
            }
            
        }
        .accessibilityElement(children: .ignore) //Can ignore the builtin accessibility of the child views and add your own below
        .accessibilityLabel("Time Remaining") //when people using VO hear it, we have simplified it down to Time remaining so they understand easier and quicker
        .accessibilityValue("\(minutesRemaining) minutes") //VO will read the value
        .padding([.horizontal, .top])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 200, secondsRemaining: 350, theme: .buttercup).previewLayout(.sizeThatFits)
}
