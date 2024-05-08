//
//  ContentView.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 07.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDay = true
    private let dataStore = DataStore.shared
    
    var body: some View {
        ZStack {
            Rectangle()
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        isDay
                        ? dataStore.day.skyColorTop
                        : dataStore.night.skyColorTop,
                        isDay
                        ? dataStore.day.skyColorBottom
                        : dataStore.night.skyColorBottom
                    ]
                ),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.5)
            )
            
            VStack {
                if !isDay {
                    StarsView()
                        .frame(height: 500)
                }
                Spacer()
            }

            VStack {
                Spacer()
                if isDay {
                    Sun(color: .sun)
                        .frame(width: 100)
                        .offset(y: -60)
                        .transition(.customTransition)
                } else {
                    Moon(color: .white)
                        .frame(width: 100, height: 100)
                        .transition(.customTransition)
                }
                Spacer()
                Spacer()
            }
            
            GeometryReader { geometry in
                let height = geometry.size.height
                
                Cloud(colorTop: .white, colorBottom: .cloudBottom)
                    .frame(height: height * 0.5)
                    .offset(y: isDay ? height * 0.45 : height * 0.7)
                    .opacity(isDay ? 1 : 0)
                    .animation(.easeInOut(duration: 2.5), value: isDay)
            }
            
            VStack {
                Spacer()
                Mountains(
                    colorTop: isDay
                    ? dataStore.day.farMountainsColorTop
                    : dataStore.night.farMountainsColorTop,
                    colorBottom: isDay
                    ? dataStore.day.farMountainsColorBottom
                    : dataStore.night.farMountainsColorBottom
                )
                .frame(height: 350)
            }
            
            VStack {
                Spacer()
                Mountains(
                    colorTop: isDay
                    ? dataStore.day.nearMountainsColorTop
                    : dataStore.night.nearMountainsColorTop,
                    colorBottom: isDay
                    ? dataStore.day.nearMountainsColorBottom
                    : dataStore.night.nearMountainsColorBottom
                )
                .frame(height: 250)
                .scaleEffect(x: -1, y: 1, anchor: .bottom)
            }
            
            VStack {
                Spacer()
                Lake(
                    colorSide: isDay
                    ? dataStore.day.lakeColorSide
                    : dataStore.night.lakeColorSide,
                    colorCenter: isDay
                    ? dataStore.day.lakeColorCenter
                    : dataStore.night.lakeColorCenter
                )
                .frame(height: 150)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: buttonAction) {
                        Image(systemName: isDay ? "moon.fill" : "sun.max.fill")
                            .rotationEffect(.degrees(isDay ? 0 : 360))
                    }
                    .frame(width: 50, height: 50)
                    .background(.white)
                    .clipShape(Circle())
                    .opacity(0.7)
                    .padding(40)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func buttonAction() {
        withAnimation(.easeInOut(duration: 1.5)) {
            isDay.toggle()
        }
    }
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.offset(x: -400, y: 200)
            .combined(with: .scale(scale: 1.2))
        let removal = AnyTransition.offset(x: 600, y: 100)
            .combined(with: .scale(scale: 0.8))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

#Preview {
    ContentView()
}
