//
//  MainTabView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/22/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .home:
                        HomeView()
                    case .search:
                        SearchView()
                    case .bookmark:
                        BookmarksView()
                    }
                }
                .tabItem {
                    Image(systemName: "camera")
                }
                .tag(tab)
            }
        }
    }
}

#Preview {
    MainTabView()
}
