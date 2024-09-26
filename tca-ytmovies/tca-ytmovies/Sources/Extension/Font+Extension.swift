//
//  Font+Extension.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

extension Font {
    // Bold
    static let poppinsBold30: Font = .custom("Poppins-Bold", size: 30)
    static let poppinsBold20: Font = .custom("Poppins-Bold", size: 20)
    
    // Medium
    static let poppinsMedium22: Font = .custom("Poppins-Medium", size: 22)
    static let poppinsMedium18: Font = .custom("Poppins-Medium", size: 18)
    
    // Regular
    static let poppinsRegular16: Font = .custom("Poppins-Regular", size: 16)
    static let poppinsRegular14: Font = .custom("Poppins-Regular", size: 14)
    static let poppinsRegular13: Font = .custom("Poppins-Regular", size: 13)
}

/// 폰트가 추가되었는지 확인
func checkFontFile() {
    for fontFamily in UIFont.familyNames {
        for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
            print(fontName)
        }
    }
}

/// 프레임을 폰트 높이에 맞추기
func heightForFontSize(_ size: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: size)
    return font.capHeight
}
