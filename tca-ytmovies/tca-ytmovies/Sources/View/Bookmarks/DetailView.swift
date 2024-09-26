//
//  DetailView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct DetailView: View {
    
    var movie: Movie?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie?.title ?? "")
                .font(.poppinsBold30)
                .multilineTextAlignment(.leading)
            
            Text(String(format: "%.1f", movie?.rating ?? 0.0))
                .font(.poppinsMedium22)
            
            Text(movie?.content ?? "")
                .font(.poppinsRegular16)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    DetailView(movie: .stub01)
}
