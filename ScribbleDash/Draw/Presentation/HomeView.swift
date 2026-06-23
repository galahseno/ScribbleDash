//
//  HomeView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("ScribbleDash")
                .typography(.headlineMedium)
                .foregroundStyle(.onBackground)
            
            VStack {
                Text("Start drawing!")
                    .typography(.headlineLarge)
                    .foregroundStyle(.onBackground)
                
                Text("Select game mode")
                    .typography(.bodyMedium)
                    .foregroundStyle(.onBackground)
                
                GameModeCardView(
                    image: .oneRoundWonder,
                    borderColor: .success,
                    gameTitle: "One Round Wonder",
                    onClick: {
                        print("tapped")
                    }
                )
                .padding(.top, 20)
            }
            .padding(.top, 80)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView()
}
