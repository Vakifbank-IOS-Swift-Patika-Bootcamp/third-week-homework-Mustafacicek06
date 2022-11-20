//
//  BaseResponse.swift
//  Heroku-App
//
//  Created by Mustafa Çiçek on 20.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let status: Int
    let title: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return title
    }
}
