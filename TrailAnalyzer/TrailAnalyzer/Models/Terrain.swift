//
//  Terrain.swift
//  TrailAnalyzer
//
//  Created by 仲里絢音 on 2026/05/09.
//
import Foundation


enum Terrain: String, Identifiable, CaseIterable {
    case paved
    case dirt
    case rocky
    case sandy


    var id: String {
        rawValue
    }
}
