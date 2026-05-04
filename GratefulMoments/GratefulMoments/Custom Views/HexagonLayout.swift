//
//  HexagonLayout.swift
//  GratefulMoments
//
//  Created by 仲里絢音 on 2026/05/05.
//
import Foundation
import SwiftUI

enum HexagonLayout { //サイズを列挙型で
    case standard
    case large


    var size: CGFloat {
        switch self {
        case .standard:
            return 200.0
        case .large:
            return 350.0
        }
    }
    
    var timestampBottomPadding: CGFloat {
           0.08
       }


   var textBottomPadding: CGFloat {
       0.25
   }


   var timestampHeight: CGFloat {
       size * (textBottomPadding - timestampBottomPadding)
   }
    
    var titleFont: Font {
            switch self {
            case .standard:
                return .headline
            case .large:
                return .title.bold()
            }
        }


        var bodyFont: Font {
            switch self {
            case .standard:
                return .caption2
            case .large:
                return .body
            }
        }
    
}
