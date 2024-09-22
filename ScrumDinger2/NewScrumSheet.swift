//
//  ScrumSheet.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 9/21/24.
//

import SwiftUI

struct NewScrumSheet: View {
    
    @Binding var isPresentingNewScrumView: Bool //binding to ScrumsView. Created an @State there and now we are watching it. Connected the value to this NewScrumSheet view
    
    @State private var newScrum = DailyScrum.emptyScrum
    //pulled in the data from the model. Allowing us to edit it through this property. we made this @State because we know another view will have to watch this property and share its data. NewScrumSheet owns this source of truth!!!! and will be sharing it with DetaileditView
    
    @Binding var scrums: [DailyScrum] //adding the scrums to the collection. 

    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum) //this will update the source of truth adding new scrums each time
                            isPresentingNewScrumView = false
                        }
                    }
             }
        }
    }
}

#Preview {
    NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
