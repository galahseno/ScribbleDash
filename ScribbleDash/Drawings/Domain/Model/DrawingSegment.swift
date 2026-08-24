//
//  DrawingSegment.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import CoreGraphics

struct DrawingSegment: Hashable {
    var points: [CGPoint]
    var isClosed: Bool
}
