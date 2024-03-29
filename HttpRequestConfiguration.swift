//
//  HttpRequestConfiguration.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

struct HttpRequestConfiguration {
    
    let serverUrl: String
    let timeoutInterval: TimeInterval?
    let headers: [String: String]
}

extension HttpRequestConfiguration {
    
    static func defaultConfiguration(serverUrl: String) -> HttpRequestConfiguration {
        return HttpRequestConfiguration(serverUrl: serverUrl, timeoutInterval: nil, headers: [:])
    }
}
