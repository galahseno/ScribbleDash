//
//  CGPathFlattener.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import CoreGraphics

nonisolated enum CGPathFlattener {
    /// Threshold is in the path's own units. SVG viewBoxes here are 100 or 200
    /// wide, so 0.1 keeps error well under a tenth of a percent.
    static func segments(from path: CGPath, threshold: CGFloat = 0.1) -> [(points: [CGPoint], isClosed: Bool)] {
        var result: [(points: [CGPoint], isClosed: Bool)] = []
        var current: [CGPoint] = []

        func flush(closed: Bool) {
            guard !current.isEmpty else { return }
            result.append((current, closed))
            current = []
        }

        path.flattened(threshold: threshold).applyWithBlock { elementPointer in
            switch elementPointer.pointee.type {
            case .moveToPoint:
                flush(closed: false)
                current = [elementPointer.pointee.points[0]]

            case .addLineToPoint:
                current.append(elementPointer.pointee.points[0])

            case .closeSubpath:
                flush(closed: true)

            default:
                break // flattened paths contain no curve elements
            }
        }
        flush(closed: false)
        return result
    }
}
