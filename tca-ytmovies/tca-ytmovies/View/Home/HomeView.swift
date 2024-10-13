//
//  HomeView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/22/24.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
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
        .onAppear {
            // TODO: 한 번에 호출하도록 수정
            store.send(.getLatestMovie)
            store.send(.getTopFiveMovies)
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
                ForEach(store.topFiveMovies) { movie in
                    topFiveViewCell(movie: movie)
                }
                
            }
        }
    }
    
    @ViewBuilder
    func topFiveViewCell(movie: Movie) -> some View {
        VStack(alignment: .leading) {
            AsyncImage(url:
                        URL(string: movie.largeCoverImage ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                case .empty:
                    Text("none")
                case .failure(_):
                    Text("none")
                @unknown default:
                    Text("none")
                }
            }
            
            Text(movie.title ?? "")
                .foregroundStyle(Color.white)
                .font(.poppinsBold20)
            HStack {
                Text(String(format: "%.1f", movie.rating ?? 0.0))
                    .foregroundStyle(Color.white)
                    .font(.poppinsMedium22)
            }
        }
    }
    
    var seeMoreButtonView: some View {
        Text("SEE MORE")
    }
    
    func latestView() -> some View {
        VStack {
            MovieContentCellView(movie: store.latestMovie)
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
