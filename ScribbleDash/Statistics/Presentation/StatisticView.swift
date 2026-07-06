//
//  StatisticView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

struct StatisticsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "chart.bar.fill")
                .font(.system(size: 48))
                .foregroundStyle(.tint)
            Text("Your Statistics")
                .font(.title2)
        }
        .padding()
        .background(AppGradients.backgroundGradient)
    }
}
