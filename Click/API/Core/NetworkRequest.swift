//
//  NetworkRequest.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

struct NetworkRequest {
    let endpoint: Endpoint
    let method: HTTPMethod
    let queryItems: [String: String]
    let body: Data?
    
    init(endpoint: Endpoint, method: HTTPMethod, queryItems: [String: String] = [:]) {
        self.endpoint = endpoint
        self.method = method
        self.queryItems = queryItems
        self.body = nil
    }
    
    init<T: Encodable>(endpoint: Endpoint, method: HTTPMethod, parameters: T) {
        self.endpoint = endpoint
        self.method = method
        self.queryItems = [:]
        self.body = try? Data.encode(parameters)
    }
    
    func urlRequest(environment: NetworkEnvironment, bearerToken: String?) async throws -> URLRequest {
        var request = URLRequest(url: environment.baseURL
            .appendingPathComponent(endpoint.path)
            .appending(queryItems: queryItems.urlItems))
        request.httpMethod = method.rawValue
        if let body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        if let bearerToken {
            request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}

private extension Dictionary where Key == String, Value == String {
    var urlItems: [URLQueryItem] {
        map { URLQueryItem(name: $0, value: $1) }
    }
}
