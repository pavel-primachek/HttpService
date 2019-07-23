//
//  HttpRequestConfiguratorImpl.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation


final class HttpRequestConfiguratorImpl: HttpRequestConfigurator {
    
    private enum HeaderField: String {
        case contentType = "Content-Type"
        case contentLength = "Content-Length"
    }
    
    private let serverUrl: String
    private var timeoutInterval: TimeInterval?
    private var httpHeaders = [String: String]()
    
    // MARK: - Initialization
    
    init(_ serverUrl: String) {
        self.serverUrl = serverUrl
    }
    
    // MARK: - Public
    
    func contentType(_ contentType: ContentType) -> Self {
        addHeaderField(.contentType, value: contentType.rawValue)
        return self
    }
    
    func contentLength(_ contentLength: UInt) -> Self {
        addHeaderField(.contentLength, value: String(contentLength))
        return self
    }
    
    func timeout(_ timeout: UInt) -> Self {
        timeoutInterval = TimeInterval(timeout)
        return self
    }
    
    func buildConfiguration() -> HttpRequestConfiguration {
        return HttpRequestConfiguration(
            serverUrl: serverUrl,
            timeoutInterval: timeoutInterval,
            headers: httpHeaders)
    }
    
    // MARK: - Private
    
    private func addHeaderField(_ headerField: HeaderField, value: String) {
        httpHeaders[headerField.rawValue] = value
    }
}
