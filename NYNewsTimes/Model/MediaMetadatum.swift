//
//  ApiManager.swift
//  MediaMetadatum
//
//  Created by Jeeva on 16/12/20.
//


import Foundation

class MediaMetadatum: Codable {
    let url: String?
    let format: String?
    let height, width: Int?

    init(url: String?, format: String?, height: Int?, width: Int?) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}
