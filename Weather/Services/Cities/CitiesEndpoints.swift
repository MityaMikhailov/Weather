//
//  CitiesEndpoints.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import Foundation
import Moya

enum CitiesEndpoints {
    case getWeather
}

extension CitiesEndpoints: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.open-meteo.com/v1/")!
    }
    
    var path: String {
        return "forecast"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getWeather:
            let parameters: [String: Any] = [
                "latitude": "43.2567,55.7522,24.4512,55.0415,59.9386,40.4165,43.7333",
                "longitude": "76.9286,37.6156,54.397,82.9346,30.3141,-3.7026,7",
                "current": "temperature_2m,weather_code",
                "hourly": "temperature_2m,weather_code",
                "daily": "temperature_2m_max,temperature_2m_min",
                "timezone": "auto"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
