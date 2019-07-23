//
//  ConnectionTaskHttpService.swift
//  Viber
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Viber Media, Inc. All rights reserved.
//

import Foundation

final class ConnectionTaskHttpService: HttpService {

    private let logger = Logger.Networking
    private let connectionTaskFactory: VIBConnectionTaskFactoryProtocol
    private let requestBuilder: HttpUrlRequestBuilder
    private let configuration: HttpRequestConfiguration
    
    init(connectionTaskFactory: VIBConnectionTaskFactoryProtocol,
         requestBuilder: HttpUrlRequestBuilder,
         configuration: HttpRequestConfiguration) {
        
        self.connectionTaskFactory = connectionTaskFactory
        self.requestBuilder = requestBuilder
        self.configuration = configuration
    }
    
    func sendRequest<Request, Response>(_ request: Request, completionHandler: @escaping (HttpServiceResult<Response>) -> Void)
        where Request: Encodable, Request: RequestRelativeUrlPathProvider, Response: Decodable {
        
        do {
            let urlRequest = try requestBuilder.build(request: request, configuration: configuration)
            connectionTaskFactory.connection(with: urlRequest, queue: DispatchQueue.global()) { response, data, error in
                if let error = error {
                    completionHandler(.failure(.connectionFailed(reason: .underlyingError(reason: error.localizedDescription))))
                    return
                }
                
                guard let httpResponse = response else {
                    completionHandler(.failure(.connectionFailed(reason: .httpResponseNil)))
                    return
                }
                
                guard httpResponse.statusCode == HttpResponseStatusCode.ok.rawValue else {
                    completionHandler(.failure(.connectionFailed(reason: .unsuccessfullHttpResponseCode(code: httpResponse.statusCode))))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(.connectionFailed(reason: .dataNil)))
                    return
                }
                
                do {
                    let response: Response = try self.deserialize(data)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(HttpServiceError.deserializationFailed(reason: error.localizedDescription)))
                }
            }
        }
        catch let error as HttpServiceError {
            completionHandler(.failure(error))
        }
        catch {
            completionHandler(.failure(.unknown(reason: error.localizedDescription)))
        }
    }
    
    private func deserialize<T>(_ data: Data) throws -> T where T: Decodable {
        let dataString = String(data: data, encoding: .utf8) ?? "Can not convert data to string"
        logger.debug("Receive response. String: " + dataString)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
