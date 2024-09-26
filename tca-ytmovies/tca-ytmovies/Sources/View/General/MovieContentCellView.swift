//
//  MovieContentCellView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct MovieContentCellView: View {
    
    var movie: Movie?
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image("")
                .frame(width: 182, height: 273)
                .background(Color.searchBarBackground)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 0) {
                Text(movie?.title ?? "")
                    .font(.poppinsBold20)
                    
                Text(String(format: "%.1f", movie?.rating ?? 0.0))
                    .font(.poppinsMedium22)
                
                Text(movie?.genre ?? "")
                    .font(.poppinsRegular14)
                
                Text(movie?.content ?? "")
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .font(.poppinsRegular13)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MovieContentCellView(movie: .stub01)
}
