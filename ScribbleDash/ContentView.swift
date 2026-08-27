//
//  ContentView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 09/06/26.
//

import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case statistics, home
        #if DEBUG
        case debugDrawings
        #endif
    }
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                StatisticsView()
            }
            .tabItem {
                Image(.chart)
                    .renderingMode(selection == .statistics ? .template : .original)
            }
            .tag(Tab.statistics)

            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(.home)
                    .renderingMode(selection == .home ? .template : .original)
            }
            .tag(Tab.home)

            #if DEBUG
            NavigationStack {
                DrawingDebugPreviewView()
            }
            .tabItem {
                Label("SVG Debug", systemImage: "ladybug")
            }
            .tag(Tab.debugDrawings)
            #endif
        }
        .tint(selection == .home ? Color(.brandPrimary) : Color(.tertiary))
        .task {
            await DrawingLoader.shared.loadIfNeeded()
        }
    }
}

#Preview {
    ContentView()
}
