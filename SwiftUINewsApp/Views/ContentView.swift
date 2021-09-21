//
//  ContentView.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/21/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    var body: some View {
        
        TabView{
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feend")
                }.tag(0)
            SettingsView(darkModeEnabled: $darkModeEnabled, systemThemeenabled: $systemThemeEnabled)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }.tag(1)
        }
        .onAppear{
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
