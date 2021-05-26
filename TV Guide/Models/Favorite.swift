//
//  Favorite.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/25/21.
//

import Foundation

class Favorite: ObservableObject {
    
    @Published var load = [TvShows]()
    
    var itemArray = [TvShows]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    
    func encodeData(toSave: TvShows) {
        
        loadData()
        
        load.append(toSave)
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(load)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding data, \(error)")
        }
    }
    
    
    
    
    
    func loadData() {
        
        load.removeAll()
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                load = try decoder.decode([TvShows].self, from: data)
            } catch {
                print("Error decoding data, \(error)")
            }
            
            
            
        }
    }
}
