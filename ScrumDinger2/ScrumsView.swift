//
//  ScrumsView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/7/24.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum] //Need to pass data through here so going to use Binding since ScrumsView needs to update when DetailsView is changed. It used to be let scrums: [DailyScrum]
    
    /*Displaying data in a list via a List. Able to access the data through the instance of scrums up top and using a keypath of id/ marker passed through the parameter
     
     List(scrums, id: \.title) { scrum in
     
     Regarding DestinationNavLink
     The destination presents a single view in the navigation hierarchy when a user interacts with the element. Each row pushes to an individual destination. The Text view acts as a placeholder until you create the detail screen in the next section.
     */
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum To Be Added")
            }
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
