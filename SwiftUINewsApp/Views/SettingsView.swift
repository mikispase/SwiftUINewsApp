//
//  SettingsView.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/21/21.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkModeEnabled:Bool
    @Binding var systemThemeenabled:Bool

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Display"), footer: Text("System settings will overwrite dark mode and use the current device theme")) {
                    Toggle(isOn: $darkModeEnabled, label: {
                        Text("Dark Mode")
                    }).onChange(of: darkModeEnabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeenabled)
                    })
                    
                    Toggle(isOn: $systemThemeenabled, label: {
                        Text("Use system settings")
                    })
                    .onChange(of: systemThemeenabled, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeenabled)
                    })
                }
                
                Section{
                    Label("Follow me on facebook @dimitar.spasovski", systemImage: "link")

                }
                .foregroundColor(Theme.textColor)
                .font(.system(size: 16, weight: .semibold))
                
            }
            .navigationTitle("Settings")
        }


    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(darkModeEnabled: .constant(false), systemThemeenabled: .constant(false))
    }
}
