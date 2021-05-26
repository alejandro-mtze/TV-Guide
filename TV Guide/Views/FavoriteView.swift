//
//  FavoriteView.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/21/21.
//

import SwiftUI
import URLImage

struct FavoriteView: View {
    
    @ObservedObject var favorite = Favorite()
    
    var body: some View {
        NavigationView {
            List(favorite.load) {show in
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
            
            .onAppear {
                favorite.loadData()
            }
        }
        
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
