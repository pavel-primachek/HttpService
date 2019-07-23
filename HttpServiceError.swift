//
//  ViberApiError.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

/**
 Main error of Viber subsystem.
 */
enum HttpServiceError: Error {
    
    enum UrlBuildingFailureReason {
        case serverUrlNil(serverUrl: String)
        case serverUrlWithRelativePathNil(serverUrl: String, relativeUrl: String)
        case urlComponentsNil(absoluteUrl: String)
        case resultUrlNil(components: String)
        case notStringConvertibleParameter(parameter: Any)
    }
    
    enum ConnectionFailureReason {
        case underlyingError(reason: String)
        case httpResponseNil
        case unsuccessfullHttpResponseCode(code: Int)
        case dataNil
    }
    
    case urlBuildingFailed(reason: UrlBuildingFailureReason)
    case deserializationFailed(reason: String)
    case serializationFailed(reason: String)
    case tokenReceivingFailed
    case connectionFailed(reason: ConnectionFailureReason)
    case unknown(reason: String)
}
