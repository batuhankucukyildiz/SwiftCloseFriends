//
//  NetworkManager.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func request<T: Decodable>(_ endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        let urlSessionTask = URLSession.shared.dataTask(with: endpoint.request()) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: nil)
                completion(.failure(unknownError))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                let statusCodeError = NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)
                completion(.failure(statusCodeError))
                return
            }
            
            if let data = data {
                do {
                    let decodedJsonData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedJsonData))
                } catch let decodingError {
                    completion(.failure(decodingError))
                }
            }
        }
        urlSessionTask.resume()
    }
    /*
    func getAllExchangeData(completion : @escaping(Result<ExchangeModel , Error>) ->Void) -> Void {
        let endpoint = EndPoint.getExchangeDetails
        request(endpoint, completion: completion)
    }
     */
}

