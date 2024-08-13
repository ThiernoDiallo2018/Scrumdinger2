//
//  TrailingIconLabelStyle.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 7/30/24.
//

import SwiftUI


//Creating a custom style label - can use this anywhere in the app. 

struct TrailingIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            
            configuration.title
            configuration.icon
        }
    }
    
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    
    static var trailingIcon: Self { Self() }
}

