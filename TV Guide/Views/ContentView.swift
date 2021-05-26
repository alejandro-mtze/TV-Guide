//
//  ContentView.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["house", "person", "heart", "magnifyingglass"]
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
//            GeneresView()
//                .tabItem {
//                    Label("Generes", systemImage: "book")
//                }
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
