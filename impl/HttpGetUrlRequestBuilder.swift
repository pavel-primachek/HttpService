//
//  HttpGetUrlRequestBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

final class HttpGetUrlRequestBuilder: HttpUrlRequestBuilder {

    private let urlBuilder: HttpUrlBuilder
    
    init(_ urlBuilder: HttpUrlBuilder) {
        self.urlBuilder = urlBuilder
    }
    
    func build<Request>(request: Request, configuration: HttpRequestConfiguration) throws -> URLRequest
        where Request: RequestRelativeUrlPathProvider, Request: Encodable {
        
        let data = try JSONEncoder().encode(request)
        guard let parameters = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
            throw HttpServiceError.serializationFailed(reason: "Failed to get json map from data")
        }
        
        let url = try urlBuilder.buildUrl(serverUrl: configuration.serverUrl, relativeUrlPath: request.getRelativeUrlPath(), parameters: parameters)
          
        return UrlRequestCreator.urlRequest(url: url, httpMethod: .get, configuration: configuration)
    }
}
