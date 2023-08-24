//
//  Endpoint.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import Foundation

protocol EndPointProtocol{
    var baseUrl : String {get}
    var path : String {get}
    var method : HttpMethod {get}
    var header : [String : String]? {get}
    func request()->URLRequest
    
}
enum HttpMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum EndPoint{
    case users
}

extension EndPoint : EndPointProtocol{
    var baseUrl: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
            case .users : return "/users"
        }
    }
    
    var method: HttpMethod {
        switch self{
            case .users : return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var compenent = URLComponents(string: baseUrl) else {
            fatalError("InvalidURL")
        }
        compenent.path = path
        var request = URLRequest(url: compenent.url!)
        request.httpMethod = method.rawValue
        return request
    }
}
