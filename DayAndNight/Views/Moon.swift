//
//  Moon.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct Moon: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let pointX = size * 0.66
            let radius = size * 0.445
            
            Path { path in
                path.addArc(
                    center: CGPoint(x: middle, y: middle),
                    radius: middle,
                    startAngle: .degrees(300),
                    endAngle: .degrees(60),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: pointX, y: middle),
                    radius: radius,
                    startAngle: .degrees(83),
                    endAngle: .degrees(277),
                    clockwise: false
                )
            }
            .foregroundStyle(color)
            .shadow(color: color, radius: 10)
        }
    }
}

#Preview {
    Moon(color: .yellow)
        .frame(width: 300, height: 300)
}
