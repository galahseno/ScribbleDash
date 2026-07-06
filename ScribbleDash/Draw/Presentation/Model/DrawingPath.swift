//
//  DrawingPath.swift
//  ScribbleDash
//
//  Created by Galah Seno on 29/6/26.
//

import CoreGraphics

/// A single committed stroke: an ordered sequence of CGPoint from touch-down to touch-up.
struct DrawingPath {
    var points: [CGPoint]
}
