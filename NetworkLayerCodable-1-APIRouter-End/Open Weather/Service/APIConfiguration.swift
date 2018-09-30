//
//  APIConfiguration.swift
//  Open Weather
//
//  Created by Theo Mendes on 30/09/18.
//  Copyright © 2018 jess. All rights reserved.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
