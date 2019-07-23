//
//  HttpServiceDemo.swift
//  Viber
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Viber Media, Inc. All rights reserved.
//

import Foundation


class HttpServiceDemo {
    
    func test() {
        
        let configuration = HttpRequestConfiguratorImpl("www.rudkouski.com")
            .contentType(.json)
            .timeout(5)
            .build()
        
        let service = HttpServiceFactory.createGetService(configuration)
        let request = ViberOutGetBalanceRequest(phone: "", token: "", timestamp: 43, language: nil)
        service.sendRequest(request) { (result: HttpServiceResult<ViberOutGetBalanceResponse>) in
        }
    }
}
