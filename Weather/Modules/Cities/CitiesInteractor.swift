//
//  CitiesInteractor.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class CitiesInteractor: CitiesInteractorProtocol {

    weak var presenter: CitiesPresenterProtocol?
    private let citiesService: CitiesServiceProtocol
    
    init(container: DependencyContainer) {
        self.citiesService = container.resolve(CitiesServiceProtocol.self)!
    }
    
    func fetchData() {
        citiesService.getWeather { [weak self] reslt in
            switch reslt {
            case .success(let success):
                self?.presenter?.handleSuccess(model: success)
            case .failure(let failure):
                self?.presenter?.handleFailure(message: failure.localizedDescription)
            }
        }
    }
}
