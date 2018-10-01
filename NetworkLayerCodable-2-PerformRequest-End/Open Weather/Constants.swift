//
//  Constants.swift
//  Open Weather
//
//  Created by Theo Mendes on 30/09/18.
//  Copyright © 2018 jess. All rights reserved.
//

import Foundation

struct Constants {
    struct ProductionServer {
        static let baseURL = "https://api.openweathermap.org/data/2.5"
    }
    
    struct APIParameterKey {
        static let apiKey = "30e5180522253e5b883f1266cbdb9ca6"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
