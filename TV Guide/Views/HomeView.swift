//
//  HomeView.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/23/21.
//

import SwiftUI
import URLImage

struct HomeView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    
    var body: some View {
        
        NavigationView {
            List(networkManager.shows) {show in
                NavigationLink(destination: TvShowView(idShow: show.id)){
                    HStack {
                        URLImage(URL(string: show.title.image.url)!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150, alignment: .center)
                        }
                        VStack {
                            Text(show.title.title)
                        }
                    }
                    
                }
                
                
            }
            .navigationTitle("Most Popular TV Show")
            .onAppear {
                //networkManager.fetchData()
                networkManager.fetchTvShow()
            
        }
        
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

