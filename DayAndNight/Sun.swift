//
//  Sun.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct Sun: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .shadow(color: color, radius: 30)
    }
}

#Preview {
    Sun(color: .yellow)
        .frame(width: 100)
}
