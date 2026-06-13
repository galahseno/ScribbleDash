//
//  HomeView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "house.fill")
                .font(.system(size: 48))
                .foregroundStyle(.tint)
            Text("Welcome to Home")
                .typography(.headlineLarge)
        }
        .padding()
    }
}
