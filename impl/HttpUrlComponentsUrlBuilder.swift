//
//  HttpUrlComponentsUrlBuilder.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

/**
 Builds url using NSURLComponents.
 */
final class HttpUrlComponentsUrlBuilder: HttpUrlBuilder {
    
    func buildUrl(serverUrl: String, relativeUrlPath: String, parameters: [String: Any]) throws -> URL {
        guard let url = URL(string: relativeUrlPath, relativeTo: URL(string: serverUrl)) else {
            throw HttpServiceError.urlBuildingFailed(reason: .serverUrlWithRelativePathNil(serverUrl: serverUrl, relativeUrl: relativeUrlPath))
        }
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw HttpServiceError.urlBuildingFailed(reason: .urlComponentsNil(absoluteUrl: url.absoluteString))
        }
        
        components.queryItems = try parameters.map { key, value in
            guard let stringConvertible = value as? CustomStringConvertible else {
                throw HttpServiceError.urlBuildingFailed(reason: .notStringConvertibleParameter(parameter: value))
            }
            
            return URLQueryItem(name: key, value: stringConvertible.description)
        }
        
        guard let resultUrl = components.url else {
            throw HttpServiceError.urlBuildingFailed(reason: .resultUrlNil(components: String(describing: components)))
        }
        
        return resultUrl
    }
}
