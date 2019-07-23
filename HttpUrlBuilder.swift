//
//  HttpUrlBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

/**
Is intended to build url string. It can be useful for building url for GET requests.
*/
protocol HttpUrlBuilder {
    
    /**
     Builds url based on passed parameters.
     */
    func buildUrl(serverUrl: String, relativeUrlPath: String, parameters: [String: Any]) throws -> URL
}
