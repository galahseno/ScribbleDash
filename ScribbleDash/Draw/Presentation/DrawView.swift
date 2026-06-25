//
//  Draw.View.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 25/6/26.
//

import SwiftUI

struct DrawView: View {
    let difficulty: Difficulty
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.background.ignoresSafeArea()
            
            VStack {
                Text("Ready. set ....")
                    .typography(.displayMedium)
                
                Text("Selected difficulty: \(difficulty.title)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    DrawView(
        difficulty: Difficulty.beginner
    )
}
