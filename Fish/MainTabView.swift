//
//  MainTabView.swift
//  Fish
//
//  Created by Dave Kondris on 22/04/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContactsList()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                    Text("Contacts")
                }.tag(1)
            ObservableMacroView()
                .tabItem{
                    Image(systemName: "at")
                    Text("Levels")
                }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
