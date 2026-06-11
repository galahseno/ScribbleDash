//
//  AppGradients.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

public enum AppGradients {
    public static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(hexARGB: 0xFFFEFAF6),
                Color(hexARGB: 0xFFFFF1E2),
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    public static var streakGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(hexARGB: 0xFF00F9FC),
                Color(hexARGB: 0xFF0081FC),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    public static var streakLostGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(hexARGB: 0xFFDE004C),
                Color(hexARGB: 0xFFFF003B),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    public static var highScoreGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(hexARGB: 0xFFFF9600),
                Color(hexARGB: 0xFFFFDA35),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
