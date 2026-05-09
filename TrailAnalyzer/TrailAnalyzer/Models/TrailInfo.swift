//
//  TrailInfo.swift.swift
//  TrailAnalyzer
//
//  Created by 仲里絢音 on 2026/05/09.
//

import Foundation

struct TrailInfo {
    var distance: Int?
    var elevation: Int?
    var terrain: Terrain?
    var wildlifeDangerLevel: Int = lowDanger


    static let lowDanger = 0
    static let highDanger = 1


    static var empty = TrailInfo()
    static var sample = TrailInfo(distance: 20, elevation: 200, terrain: .dirt, wildlifeDangerLevel: highDanger)
}
