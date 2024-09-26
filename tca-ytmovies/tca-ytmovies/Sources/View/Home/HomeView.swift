//
//  HomeView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/22/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 30) {
                headerView(header: "Top Five")
                topFiveView
                VStack {
                    HStack {
                        headerView(header: "Latest")
                        Spacer()
                        seeMoreButtonView
                    }
                    latestView()
                }
                
            }
            .padding(.horizontal, 16)
        }
    }
    
    func headerView(header: String) -> some View {
        HStack(spacing: 0) {
            Text(header)
            Text(".")
                .foregroundStyle(Color.yellow)
        }
        .font(.poppinsBold30)
    }
    
    @ViewBuilder
    var topFiveView: some View {
        ScrollView(.horizontal) {
            HStack {
                topFiveViewCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
                topFiveViewCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
                topFiveViewCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
                topFiveViewCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
                topFiveViewCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
                
            }
        }
    }
    
    @ViewBuilder
    func topFiveViewCell(title: String, rating: Double) -> some View {
        VStack(alignment: .leading) {
            Image("")
                .frame(width: 300, height: 200)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(title)
                .font(.poppinsBold20)
            HStack {
                Text(String(format: "%.1f", rating))
                    .font(.poppinsMedium22)
            }
        }
    }
    
    var seeMoreButtonView: some View {
        Text("SEE MORE")
    }
    
    func latestView() -> some View {
        VStack {
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
        }
        
    }
    
    func latestCellView(title: String, rating: Double, genre: String,  content: String) -> some View {
        HStack(spacing: 16) {
            Image("")
                .frame(width: 182, height: 273)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading) {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(String(format: "%.1f", rating))
                Text(content)
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView()
}
