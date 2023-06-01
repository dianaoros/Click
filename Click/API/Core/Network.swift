//
//  Network.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import Foundation

public protocol AuthTokenProvider {
    var authToken: String? { get async throws }
}

final public class Network: ObservableObject {
    public let tokenProvider: AuthTokenProvider
    
    private let environment: NetworkEnvironment
    private let session: URLSession
    
    public init(environment: NetworkEnvironment, tokenProvider: AuthTokenProvider) {
        self.environment = environment
        self.session = URLSession.shared
        self.tokenProvider = tokenProvider
    }
}

@NetworkActor
public extension Network {
    func get<R: Decodable & Sendable>(_ endpoint: Endpoint) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .get))
    }
    
    func get<R: Decodable & Sendable>(_ endpoint: Endpoint, queryItems: [String: String]) async throws -> R {
        try await load (NetworkRequest(endpoint: endpoint, method: .get, queryItems: queryItems))
    }
    
    func post<R: Decodable & Sendable>(_ endpoint: Endpoint) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .post))
    }
    
    func post<R: Decodable & Sendable>(_ endpoint: Endpoint, queryItems: [String: String]) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .post, queryItems: queryItems))
    }
    
    func post<P: Encodable, R: Decodable & Sendable>(_ endpoint: Endpoint, parameters: P) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .post, parameters: parameters))
    }
    
    func put<R: Decodable & Sendable>(_ endpoint: Endpoint) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .put))
    }
    
    func put<P: Encodable, R: Decodable & Sendable>(_ endpoint: Endpoint, parameters: P) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .put, parameters: parameters))
    }
    
    func patch<R: Decodable & Sendable>(_ endpoint: Endpoint) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .patch))
    }
    
    func patch<P: Encodable, R: Decodable & Sendable>(_ endpoint: Endpoint, parameters: P) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .patch, parameters: parameters))
    }
    
    func delete<R: Decodable & Sendable>(_ endpoint: Endpoint) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .delete))
    }
    
    func delete(_ endpoint: Endpoint) async throws {
        try await load(NetworkRequest(endpoint: endpoint, method: .delete))
    }
    
    func delete<P: Encodable, R: Decodable & Sendable>(_ endpoint: Endpoint, parameters: P) async throws -> R {
        try await load(NetworkRequest(endpoint: endpoint, method: .delete, parameters: parameters))
    }
}

private extension Network {
    func load<T: Decodable & Sendable>(_ request: NetworkRequest) async throws -> T {
        let urlRequest = try await request.urlRequest(
            environment: environment,
            bearerToken: tokenProvider.authToken)
        let (data, response) = try await session.data(for: urlRequest)
        if let response = response as? HTTPURLResponse, response.statusCode >= 400 {
            throw StatusError(code: response.statusCode)
        }
        return try data.decode()
    }
    
    //TODO: - unify no return value approach
    func load(_ request: NetworkRequest) async throws {
        let urlRequest = try await request.urlRequest(
            environment: environment,
            bearerToken: tokenProvider.authToken)
        let (_, response) = try await session.data(for: urlRequest)
        if let response = response as? HTTPURLResponse, response.statusCode >= 400 {
            throw StatusError(code: response.statusCode)
        }
    }
}
