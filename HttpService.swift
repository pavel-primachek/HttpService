//
//  HttpService.swift
//  Viber
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Viber Media, Inc. All rights reserved.
//

import Foundation

enum HttpServiceResult<Response> {
    case success(Response)
    case failure(HttpServiceError)
}


protocol HttpService {
    
    func sendRequest<Request, Response>(_ request: Request, completionHandler: @escaping(HttpServiceResult<Response>) -> Void)
        where Request: Encodable & RequestRelativeUrlPathProvider, Response: Decodable
}
