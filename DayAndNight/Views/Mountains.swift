//
//  Mountains.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 07.05.24.
//

import SwiftUI

struct Mountains: View {
    let colorTop: Color
    let colorBottom: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let pointX = width * 0.1
            let pointY = height * 0.1
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: pointY * 3))
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 1, y: pointY * 2),
                    control: CGPoint(x: pointX * 0.5, y: pointY * 2.7)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 3.5, y: pointY * 2),
                    control: CGPoint(x: pointX * 2.25, y: 0)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 5.5, y: pointY * 2),
                    control: CGPoint(x: pointX * 4.25, y: pointY * 3)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 7.5, y: pointY * 2),
                    control: CGPoint(x: pointX * 6.57, y: pointY)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 9, y: pointY * 3),
                    control: CGPoint(x: pointX * 8.5, y: pointY * 3)
                )
                path.addQuadCurve(
                    to: CGPoint(x: width, y: pointY * 2.5),
                    control: CGPoint(x: pointX * 9.5, y: pointY * 3)
                )
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [colorTop, colorBottom]),
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.5)
                )
            )
        }
    }
}

#Preview {
    Mountains(colorTop: .purple, colorBottom: .blue)
        .frame(width: 300, height: 300)
}
