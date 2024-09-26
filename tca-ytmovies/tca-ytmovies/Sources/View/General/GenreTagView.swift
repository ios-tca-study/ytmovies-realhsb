//
//  GenreTagView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct GenreTagView: View {
    
    var genre: String?
    
    var body: some View {
        Text(genre ?? "")
            .font(.poppinsRegular13)
            .padding(.horizontal, 16)
            .padding(.vertical, 2)
            .background(Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}

#Preview {
    GenreTagView(genre: "genre")
}
