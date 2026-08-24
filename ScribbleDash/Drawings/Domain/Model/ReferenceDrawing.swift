//
//  ReferenceDrawing.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import CoreGraphics

struct ReferenceDrawing: Identifiable, Hashable {
    let id: String
    let name: String
    let viewBox: CGRect
    let segments: [DrawingSegment]
}
