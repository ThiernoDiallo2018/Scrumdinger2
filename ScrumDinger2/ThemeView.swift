//
//  ThemeView.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/17/24.
//

import SwiftUI

struct ThemeView: View {
    
    //Everything is a view - we have views within views. We are using this View within ThemePicker()
    
      let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .frame(maxWidth: .infinity) // the order of modifiers matter. If you switch this mod and the background mod, its max width would only be the textview and not the parent view
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(4) //With this now you can see the clipshape
        
    }
}

#Preview {
    ThemeView(theme: Theme.buttercup)
}
