//
//  ContentView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 09/06/26.
//

import SwiftUI

struct ContentView: View {
    enum Tab: Hashable { case statistics, home }
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                StatisticsView()
            }
            .tabItem {
                Image("Chart")
                    .renderingMode(selection == .statistics ? .template : .original)
            }
            .tag(Tab.statistics)

            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image("Home")
                    .renderingMode(selection == .home ? .template : .original)
            }
            .tag(Tab.home)
        }
        .tint(selection == .home ? Color("BrandPrimary") : Color("Tertiary"))
    }
}

#Preview {
    ContentView()
}
