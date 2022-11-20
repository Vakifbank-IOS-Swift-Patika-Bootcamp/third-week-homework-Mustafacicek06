//
//  Client.swift
//  Heroku-App
//
//  Created by Mustafa Çiçek on 20.11.2022.
//

import Foundation

class NetworkClient {
    
    
    enum Endpoints {
        
        static let base = "https://programming-quotes-api.herokuapp.com/Quotes/"

               
                case getQuotesRandom

                var stringValue: String {
                    switch self {
                    case .getQuotesRandom:
                        return Endpoints.base + "random"
                
                    }
                }

                var url: URL {
                    return URL(string: stringValue)!
                }
    }
    
    @discardableResult
       class func taskForGETRequest<ResponseType: Decodable>(url: URL, responsetType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data else {
                   DispatchQueue.main.async {
                       completion(nil, error)
                   }
                   print(data?.description)
                   return
               }
               let decoder = JSONDecoder()
               do {
                   let responseObject = try decoder.decode(ResponseType.self, from: data)
                   DispatchQueue.main.async {
                       completion(responseObject, nil)
                   }
               } catch {
                   do {
                       let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                       DispatchQueue.main.async {
                           completion(nil, errorResponse)
                       }
                   } catch {
                       DispatchQueue.main.async {
                           completion(nil, error)
                       }
                   }
               }
           }
           task.resume()
           return task
       }
       
       class func getQuotes(completion: @escaping ( QuoteModel?, Error?) -> Void) {
           taskForGETRequest(url: Endpoints.getQuotesRandom.url, responsetType: QuoteModel.self) { response, error in
               if let response = response {
                   completion(response, nil)
               } else {
                   completion(nil, error)
               }
           }
       }
}
