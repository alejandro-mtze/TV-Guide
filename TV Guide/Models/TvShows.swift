//
//  TvShows.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/24/21.
//

import Foundation


struct TvShows: Codable, Identifiable {
    let id: String
    let title: Title
    let ratings: Ratings
    let releaseDate: String
    let plotOutline: PlotOutline
    
}

struct Title: Codable {
    let title: String
    let image: Image
    let numberOfEpisodes: Int
    let year: Int
}

struct Image: Codable {
    let url: String
}

struct Ratings: Codable {
    let rating: Double
}

struct PlotOutline: Codable {
    let text: String
}
