//
//  StarsView.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct StarsView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<25) { _ in
                    let x = CGFloat.random(in: 0...geometry.size.width)
                    let y = CGFloat.random(in: 0...geometry.size.height)
                    let size = CGFloat.random(in: 3...11)
                    
                    Star(color: .stars)
                        .frame(width: size, height: size)
                        .position(x: x, y: y)
                }
            }
        }
    }
}

#Preview {
    StarsView()
        .frame(width: 300, height: 200)
}
