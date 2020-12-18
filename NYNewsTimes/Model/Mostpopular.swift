//
//  ApiManager.swift
//  Mostpopular
//
//  Created by Jeeva on 16/12/20.
//



import Foundation

// MARK: - Mostpopular
class Mostpopular: Codable {
    let status, copyright: String?
    let numResults: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults
        case results
    }

    init(status: String?, copyright: String?, numResults: Int?, results: [Result]?) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
}
