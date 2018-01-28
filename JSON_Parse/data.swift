//
//  data.swift
//  JSON_Parse
//
//  Created by A1 on 28.01.18.
//  Copyright © 2018 A1. All rights reserved.
//

import Foundation
import UIKit

enum APIManager {
    case news
    case detail(newsId: String)
}

/**


extension APIManager: URLRequestConvertible {
    
    static let version: UInt = 1
    static let apiURL: URL = URL(string: "https://api.tinkoff.ru/")!
    static let userAgent: String = {
        return "IamTinkoffTester:Test"
    }()
    
    private struct Components {
        var version: Int = APIManager.version
        var path: String!
        var parameters: [String: Any] = [:]
        var headers: [String: String] = [:]
        var encoding: ParameterEncoding = URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let components = self.components
        
        let url = APIManager.apiURL
            .appendingPathComponent("v\(components.version)")
            .appendingPathComponent(components.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
        request.setValue(APIManager.userAgent, forHTTPHeaderField: "User-Agent")
        
        for header in components.headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return try components.encoding.encode(request, with: components.parameters)
    }
    
    private var components: Components {
        var components = Components()
        
        switch self {
        case .news:
            components.path = "news"
        case .detail(let newsId):
            components.path = "news_content"
            components.parameters["id"] = newsId
        }
        
        return components
    }
    
    private var method: HTTPMethod {
        return .get
    }
}

 */
