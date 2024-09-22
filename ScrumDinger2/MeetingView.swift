//
//  ContentView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/20/24.
//

import SwiftUI
import AVFoundation

//Declarative - using SwiftUI, everything is made up of views on top of views
//To customize views, we are going to use modifiers. You definitely remember this

/*
 
 Creating a color theme - choose two contrasting colors. One for the background and the second for the text
 
 We have rehashed on Views, Modifiers, Stacks, Accessibility...
 
 Everything is a view. Remember that!!
 
 
 */

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer() //MEETING VIEW OWNS SCRUMTIMER SOURCE OF TRUTH NOW. THE SOURCE OF TRUTH IS NOW TIED TO THE LIFECYCLE. THis is a reference. 
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme) //this was extracted and bought into the view. It has its own lifecycle
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker) //extracted as well
                
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
        private func startScrum() {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum()
        }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
    }

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
