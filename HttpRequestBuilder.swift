//
//  HttpRequestBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

protocol HttpRequestBuilder {
    
    func build<Request>(request: Request, configuration: HttpRequestConfiguration) throws -> URLRequest
        where Request: Encodable & RequestRelativeUrlPathProvider
}
