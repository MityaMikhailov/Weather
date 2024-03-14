//
//  DependecyContainerAssembly.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import Foundation
import Swinject
import Moya

public typealias DependencyContainer = Resolver

final class DependencyContainerAssembly: Assembly {
    func assemble(container: Container) {
        assembleServices(container)
    }
    
    private func assembleServices(_ container: Container) {
        container.register(CitiesServiceProtocol.self) { resolver in
            let provider = MoyaProvider<CitiesEndpoints>()
            return CitiesService(provider: provider)
        }
    }
}
