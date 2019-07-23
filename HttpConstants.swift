//
//  HttpConstants.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

enum ContentType: String {
    case json = "application/json"
    case xml = "application/xml"
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
