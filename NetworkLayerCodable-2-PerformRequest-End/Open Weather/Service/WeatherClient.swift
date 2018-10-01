//
//  WeatherClient.swift
//  Open Weather
//
//  Created by Jessica Hollander on 01/10/18.
//  Copyright © 2018 jess. All rights reserved.
//

import Alamofire

class WeatherClient{
    @discardableResult
    private static func performRequest(route: WeatherEndpoint, completion: @escaping (DataResponse<Any>?)-> Void) -> DataRequest{
        return Alamofire.request(route).validate().responseJSON { (response: DataResponse<Any>?) in
            completion(response)
            print(response?.data as Any)
            
        }
    }

    static func getCurrentWeather(cityId: Int, unit: String, completion: @escaping (CurrentWeather?, Error?) -> Void){
        performRequest(route: .current(cityId: cityId, unit: unit)){response in
            if response?.error == nil{
                if let data = response?.data, let utf8Text = String(data: data, encoding: .utf8){
                    let json = utf8Text.data(using: .utf8)
                    
                    do{
                        let decoder = JSONDecoder()
                        let decodedJson = try decoder.decode(CurrentWeather.self, from: json!)
                        completion(decodedJson, nil)
                        print(decodedJson)
                    }catch{
                        completion(nil, error)
                        print(error)
                    }
                }
            } else{
                print(response?.error as Any)
            }
        }
    }
    
}
