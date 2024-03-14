//
//  CitiesService.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import Foundation
import Moya

protocol CitiesServiceProtocol {
    func getWeather(completion: @escaping(Result<Cities, NetworkError>) -> Void)
}

final class CitiesService: CitiesServiceProtocol {
    
    private let provider: MoyaProvider<CitiesEndpoints>
    
    init(provider: MoyaProvider<CitiesEndpoints>) {
        self.provider = provider
    }
    
    func getWeather(completion: @escaping (Result<Cities, NetworkError>) -> Void) {
        provider.request(.getWeather) { result in
            let decoder = RequestDecoder.shared.decodeResult(result, for: Cities.self)
            completion(decoder)
        }
    }
}
