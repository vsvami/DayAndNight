//
//  Lake.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 07.05.24.
//

import SwiftUI

struct Lake: View {
    let colorSide: Color
    let colorCenter: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let pointX = width * 0.1
            let pointY = height * 0.1
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: pointY * 7 ))
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 5, y: pointY * 6),
                    control: CGPoint(x: pointX * 2.5, y: pointY * 9)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 5, y: pointY * 4),
                    control: CGPoint(x: pointX * 6, y: pointY * 5)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 5, y: pointY * 2),
                    control: CGPoint(x: pointX * 4, y: pointY * 3)
                )
                path.addQuadCurve(
                    to: CGPoint(x: width, y: pointY),
                    control: CGPoint(x: pointX * 8, y: 0)
                )
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [colorSide, colorCenter, colorSide]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        }
    }
}

#Preview {
    Lake(colorSide: .blue, colorCenter: .cyan)
        .frame(width: 300, height: 100)
}
