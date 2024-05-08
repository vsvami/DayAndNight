//
//  Cloud.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct Cloud: View {
    let colorTop: Color
    let colorBottom: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let pointX = width * 0.05
            let pointY = height * 0.05
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: pointY * 4))
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 4, y: pointY * 2),
                    control: CGPoint(x: pointX * 1, y: pointY)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 9, y: pointY * 3),
                    control: CGPoint(x: pointX * 7, y: 0)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 11, y: pointY * 5),
                    control: CGPoint(x: pointX * 11, y: pointY * 3)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 11, y: pointY * 7),
                    control: CGPoint(x: pointX * 12, y: pointY * 6)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 14.5, y: pointY * 5),
                    control: CGPoint(x: pointX * 13, y: pointY * 8)
                )
                path.addQuadCurve(
                    to: CGPoint(x: pointX * 18, y: pointY * 3),
                    control: CGPoint(x: pointX * 16, y: pointY * 1.5)
                )
                path.addQuadCurve(
                    to: CGPoint(x: width, y: pointY * 4),
                    control: CGPoint(x: pointX * 19.5, y: pointY * 3)
                )
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
                
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [colorTop, colorBottom]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .opacity(0.6)
            
        }
    }
}

#Preview {
    Cloud(colorTop: .white, colorBottom: .blue)
        .frame(width: 300, height: 300)
}
