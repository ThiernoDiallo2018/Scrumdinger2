//
//  ScrumProgressViewStyle.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 9/21/24.
//

import SwiftUI


struct ScrumProgressViewStyle: ProgressViewStyle { // to use progress view style, you have to use the default methods within it.It is a protocol you conform to. Similar to dealing with collections.
    
    var theme: Theme

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
                .tint(theme.mainColor)
        }
    }
}

struct ScrumProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgressViewStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits)
    }
}
