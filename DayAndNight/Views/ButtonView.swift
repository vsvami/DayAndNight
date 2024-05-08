//
//  ButtonView.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

import SwiftUI

struct ButtonView: View {
    let isDay: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isDay ? "moon.fill" : "sun.max.fill")
                .rotationEffect(.degrees(isDay ? 0 : 360))
        }
        .frame(width: 50, height: 50)
        .background(.white)
        .clipShape(Circle())
        .opacity(0.7)
    }
}

#Preview {
    ButtonView(isDay: true, action: {})
}
