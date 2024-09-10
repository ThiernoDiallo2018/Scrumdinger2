//
//  ThemePicker.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 8/17/24.
//

/*
   Create a custom interactive view for your users to choose the color theme of a meeting view. Using the theme view, you’ll list all your app’s themes in a picker control. Then, you’ll store the value of the selected theme in a variable that you bind to the parent view. In this way, the theme view communicates a theme selection up to the parent view.
 
    When dealing with data - always try to have one source of truth. Dont try to have too many. Use bindings to bring in the truth into a view to manipulate
 
 
 constant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app’s user interface.
 
 For example:
 #Preview {
     ThemePicker(selection: .constant((.periwinkle)))
 }

 */
//We are up to passing data with bindings - add a theme picker

import SwiftUI

struct ThemePicker: View {
    
    @Binding var selection: Theme //This binding connected to our source of truth back in the model will update our current parent view of ThemePicker()
    
    var body: some View {
            Picker("Theme", selection: $selection) {
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                    //tag subviews when you need to differentiate among them in controls like pickers and lists. Tag values can be any hashable type like in an enumeration.
                }
            }
            .pickerStyle(.navigationLink) // pushes the picker view onto the navigation stack. The picker view displays each theme in a ThemeView now since we passed it in as the new view. The default has the data in labels. Now, we can potentially add a destination when a consumer clicks on the color
        }
    }

#Preview {
    ThemePicker(selection: .constant((.periwinkle)))
}
