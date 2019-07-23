//
//  HttpServiceFactory.swift
//  Viber
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Viber Media, Inc. All rights reserved.
//

import Foundation

final class HttpServiceFactory {
    
    static func createGetService(_ configuration: HttpRequestConfiguration) -> HttpService {
        return ConnectionTaskHttpService(
            connectionTaskFactory: VIBConnectionTaskFactory.shared(),
            requestBuilder: HttpGetUrlRequestBuilder(HttpUrlComponentsUrlBuilder()),
            configuration: configuration)
    }
    
    static func createPostService(_ configuration: HttpRequestConfiguration) -> HttpService {
        return ConnectionTaskHttpService(
            connectionTaskFactory: VIBConnectionTaskFactory.shared(),
            requestBuilder: HttpPostUrlRequestBuilder(),
            configuration: configuration)
    }
}
