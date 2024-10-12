//
//  Color+Extension.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

extension Color {
    static let accentColor = Color(hex: "FFC700")
    static let searchBarBackground = Color(hex: "2B2B2B")
    
}

public extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
