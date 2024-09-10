//
//  CardView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/20/24.
//

import SwiftUI



struct CardView: View {
    
    let scrum: DailyScrum //Pulled in our source of truth. Sample Data we are accessing is in a collection which is marked by indexs
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meetings ")
                   
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor) // Remember, we pulled in theme via Daily Scrum

    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
