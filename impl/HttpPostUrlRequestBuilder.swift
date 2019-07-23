//
//  HttpPostUrlRequestBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

final class HttpPostUrlRequestBuilder: HttpUrlRequestBuilder {
    
    func build<Request>(request: Request, configuration: HttpRequestConfiguration) throws -> URLRequest
        where Request: RequestRelativeUrlPathProvider, Request: Encodable {
        
        guard let url = URL(string: configuration.serverUrl) else {
            throw HttpServiceError.urlBuildingFailed(reason: .serverUrlNil(serverUrl: configuration.serverUrl))
        }
        
        var urlRequest = UrlRequestCreator.urlRequest(url: url, httpMethod: .post, configuration: configuration)
        urlRequest.httpBody = try JSONEncoder().encode(request)
        return urlRequest
    }
}
