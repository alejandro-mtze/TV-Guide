//
//  SearchData.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/26/21.
//

import Foundation

struct SearchData: Codable {
    let d: [D]?
}

struct D: Codable {
    let id: String
}

/*
 d[0].id
 */

