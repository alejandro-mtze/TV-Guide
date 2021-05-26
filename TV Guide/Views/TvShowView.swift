//
//  TvShowView.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/25/21.
//

import SwiftUI
import URLImage

struct TvShowView: View {
    
    let idShow: String
    
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var favorite = Favorite()
    
    var body: some View {
        
        let rating = String(format: "%.1f", networkManager.showReq.ratings.rating)
        
        ZStack{
            VStack {
                Spacer()
                Text(networkManager.showReq.title.title)
                    .fontWeight(.heavy)
                    .bold()
                Spacer()
                Text(networkManager.showReq.plotOutline.text)
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("Ratings: \(rating)")
                Text("Relase date: \(networkManager.showReq.releaseDate)")
                Text("Number of Episodes: \(networkManager.showReq.title.numberOfEpisodes)")
                
                Spacer()
                
                Button(action: {
                    favorite.encodeData(toSave: networkManager.showReq)
                }, label: {
                    Text ("Favorite ❤️")
                        .padding(.vertical)
                })
                
                
                
                
            }
            
        }
        .onAppear {
            networkManager.fetchData(with: idShow.replacingOccurrences(of: "/", with: "").replacingOccurrences(of: "title", with: ""))
        }
    }
}

struct TvShowView_Previews: PreviewProvider {
    static var previews: some View {
        TvShowView(idShow: "")
    }
}
