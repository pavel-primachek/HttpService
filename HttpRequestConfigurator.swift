//
//  HttpRequestConfigurator.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

protocol HttpRequestConfigurator {
    
    func contentType(_ contentType: ContentType) -> Self
    func contentLength(_ contentLength: UInt) -> Self
    func timeout(_ timeout: UInt) -> Self
    
    func buildConfiguration() -> HttpRequestConfiguration
}
