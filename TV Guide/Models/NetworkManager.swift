//
//  NetworkManager.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/24/21.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var shows = [TvShows]()
    @Published var showReq = TvShows(id: "", title: Title(title: "", image: Image(url: ""), numberOfEpisodes: 0, year: 0), ratings: Ratings(rating: 1.0), releaseDate: "", plotOutline: PlotOutline(text: ""))
    
    var searchData = SearchData(d: [D]?(nilLiteral: ()))
    
    var tvShows = ["tt10155688","tt9561862","tt5774002","tt5834204"]
    
    let basicURL = "https://imdb8.p.rapidapi.com/"
    
    //let key = "rapidapi-key=c7b45677c1msh9a150469025c5acp13efc9jsn796154dd5d96"
    //let key = "rapidapi-key=7d978aa3c4msh572fed461d7ca3ap141b1djsndbc2ad965a3a"
    let key = "rapidapi-key=7fe12d9374mshb579c2451015c95p16bcd7jsn008b94ed7651"
    
    let mostPopularTvShows = "title/get-most-popular-tv-shows?homeCountry=US&purchaseCountry=US&currentCountry=US"
    
    
    
    func fetchData(with idShow: String) {
        
        let urlString = "\(basicURL)title/get-overview-details?tconst=\(idShow)&\(key)"
        
        performRequest(with: urlString)
        
    }
    
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(TvShows.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.showReq = results
                                
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchTvShow() {
        
        shows.removeAll()
        
        //fetchData()
        
        for shows in tvShows {

            
            let urlString = "\(basicURL)/title/get-overview-details?tconst=\(shows)&\(key)"
            do {
                //sleep(1)
                performRequestTvShow(with: urlString)
            }
                
            
        }
    }
    
    func performRequestTvShow(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(TvShows.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.shows.append(results)
                            }
                            
                        } catch {
                            print(error)
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func searchData(search: String) {
        
        let newSearch = search.replacingOccurrences(of: " ", with: "%20")
        
        let urlString = "\(basicURL)/auto-complete?q=\(newSearch)&\(key)"
        
        performReq(with: urlString)
        
        if searchData.d != nil {
            for search in searchData.d! {
                let newURL = "\(basicURL)/title/get-overview-details?tconst=\(search.id)&\(key)"
                performRequestTvShow(with: newURL)
            }
        }
        
        
    }
    
    func performReq(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(SearchData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.searchData = results
                            }
                            
                        } catch {
                            print(error)
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
