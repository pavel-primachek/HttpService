//
//  HttpPostRequestBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

final class HttpPostRequestBuilder: HttpRequestBuilder {
    
    func build<Request>(request: Request, configuration: HttpRequestConfiguration) throws -> URLRequest
        where Request : RequestRelativeUrlPathProvider, Request : Encodable {
        
        guard let url = URL(string: configuration.serverUrl) else {
            throw HttpServiceError.urlBuildingFailed(reason: .serverUrlWithRelativePathNil(serverUrl: configuration.serverUrl, relativeUrl: ""))
        }
        
        let body = try JSONEncoder().encode(request)
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.post.rawValue
        request.httpBody = body
        
        if let timeout = configuration.timeoutInterval {
            request.timeoutInterval = timeout
        }
        
        configuration.headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
}
