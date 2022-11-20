//
//  QuoteModel.swift
//  Heroku-App
//
//  Created by Mustafa Çiçek on 20.11.2022.
//


import Foundation

// MARK: - QuoteModelElement
struct QuoteModelElement: Codable {
    let id, author, en: String
}

typealias QuoteModel = [QuoteModelElement]
