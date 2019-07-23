//
//  RequestRelativeUrlPathProvider.swift
//  HttpServiceDemo
//
//  Created by Pavel Primachek on 7/16/19.
//  Copyright © 2019 Pavel Primachek. All rights reserved.
//

import Foundation

/**
 Provides relative url path for requests.
 Typically should be implemented in requests.
 */
protocol RequestRelativeUrlPathProvider {
    
    /**
     Returns relative url path. Template: 'x/xxx/xxx', contains API version
     */
    func getRelativeUrlPath() -> String
}
