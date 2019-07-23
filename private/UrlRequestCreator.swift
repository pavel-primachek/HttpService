//
//  UrlRequestCreator.swift
//  Viber
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Viber Media, Inc. All rights reserved.
//

import Foundation

final class UrlRequestCreator {
    
    static func urlRequest(url: URL, httpMethod: HttpMethod, configuration: HttpRequestConfiguration) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let timeout = configuration.timeoutInterval {
            request.timeoutInterval = timeout
        }
        
        configuration.headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
}
