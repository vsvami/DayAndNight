//
//  Star.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct Star: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let point = middle * 0.8
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: middle))
                path.addLine(to: CGPoint(x: point, y: point))
                path.addLine(to: CGPoint(x: middle, y: 0))
                path.addLine(to: CGPoint(x: size - point, y: point))
                path.addLine(to: CGPoint(x: size, y: middle))
                path.addLine(to: CGPoint(x: size - point, y: size - point))
                path.addLine(to: CGPoint(x: middle, y: size))
                path.addLine(to: CGPoint(x: point, y: size - point))
            }
            .foregroundStyle(color)
            .shadow(color: color, radius: 10)
        }
    }
}

#Preview {
    Star(color: .stars)
        .frame(width: 200, height: 200)
}
