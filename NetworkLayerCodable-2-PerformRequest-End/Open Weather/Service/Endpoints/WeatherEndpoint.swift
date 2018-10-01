//
//  WeatherEndpoint.swift
//  Open Weather
//
//  Created by Theo Mendes on 30/09/18.
//  Copyright © 2018 jess. All rights reserved.
//

import Alamofire

/**
Provides requests for weather operations
 
 - Returns: The request for a determinated operation
 */
enum WeatherEndpoint: APIConfiguration {
    /**
     Get the current weather for a city
     
     - Parameters:
        - cityId: The ID for the city
        - unit: metric or imperial
     */
    case current(cityId: Int, unit: String)
    /**
     Get the 5-day forecast for a city
     
     - Parameters:
        - cityId: The ID for the city
        - unit: metric or imperial
     */
    case forecast(cityId: Int, unit: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .current, .forecast:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .current(let cityId, let unit):
            return "/weather?id=\(cityId)&units=\(unit)&APPID=\(Constants.APIParameterKey.apiKey)"
            
        case .forecast(let cityId, let unit):
            return "/forecast?id=\(cityId)&units=\(unit)&APPID=\(Constants.APIParameterKey.apiKey)"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .current, .forecast:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = Constants.ProductionServer.baseURL + path
    
        var urlRequest = URLRequest(url: URL(string: url)!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        debugPrint(urlRequest)
        return urlRequest
    }
}
