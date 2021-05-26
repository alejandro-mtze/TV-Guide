//
//  SearchView.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/21/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {

                    SearchBar(text: $searchText)
                        .padding(.top, -30)
                    
                    
                    NavigationLink(destination: ResultsView(search: searchText), tag: 1, selection: $selection) {
                                            Button("Done!") {
                                                self.hideKeyboard()
                                                self.selection = 1
                                               
                                            }
                    }
                    
                }
                
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
