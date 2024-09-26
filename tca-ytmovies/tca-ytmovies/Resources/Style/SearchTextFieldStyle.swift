//
//  SearchTextFieldStyle.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct SearchTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.poppinsMedium18)
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 28)
            .background(Color.searchBarBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
