//
//  DataStore.swift
//  DayAndNight
//
//  Created by Vladimir Dmitriev on 08.05.24.
//

final class DataStore {
    static let shared = DataStore()
    
    let day = TimeOfDay(
        skyColorTop: .daySkyDark,
        skyColorBottom: .daySkyLight,
        farMountainsColorTop: .dayFarMountainsLight,
        farMountainsColorBottom: .dayFarMountainsDark,
        nearMountainsColorTop: .dayNearMountainsDark,
        nearMountainsColorBottom: .dayNearMountainsLight,
        lakeColorSide: .daySkyLight,
        lakeColorCenter: .sun
    )
    
    let night = TimeOfDay(
        skyColorTop: .nightSkyDark,
        skyColorBottom: .nightSkyLight,
        farMountainsColorTop: .nightFarMountainsLight,
        farMountainsColorBottom: .nightFarMountainsDark,
        nearMountainsColorTop: .nightNearMountainsLight,
        nearMountainsColorBottom: .nightNearMountainsDark,
        lakeColorSide: .nightLakeDark,
        lakeColorCenter: .nightLakeLight
    )
    
    private init() {}
}
