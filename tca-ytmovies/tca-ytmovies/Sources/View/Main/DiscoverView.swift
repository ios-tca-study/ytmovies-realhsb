//
//  DiscoverView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/22/24.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ScrollView {
            selectionView
            contentView
                .padding(.horizontal, 16)
        }
    }
    
    var selectionView: some View {
        ScrollView {
            HStack {
                Button {
                    
                } label: {
                    Text("All")
                }
                
                Button {
                    
                } label: {
                    Text("All")
                }
            }
            
        }
    }
    
    var contentView: some View {
        LazyHGrid(rows: [GridItem(), GridItem()]) {
            discoverCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
            discoverCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
            discoverCell(title: "Hitman’s Wife’s Bodyguard", rating: 3.5)
        }
        
    }
    
    @ViewBuilder
    func discoverCell(title: String, rating: Double) -> some View {
        VStack(alignment: .leading) {
            Image("")
                .frame(width: 300, height: 200)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(title)
            HStack {
                Text(String(format: "%.1f", rating))
            }
        }
    }
}

#Preview {
    DiscoverView()
}
