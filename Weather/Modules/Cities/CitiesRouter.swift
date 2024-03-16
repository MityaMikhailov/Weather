//
//  CitiesRouter.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import Swinject

final class CitiesRouter: CitiesWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(container: DependencyContainer) -> UIViewController {
        let view = CitiesViewController()
        let interactor = CitiesInteractor(container: container)
        let router = CitiesRouter()
        let presenter = CitiesPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func pushToCityHourly(with city: City) {
        let hourlyViewController = HourlyViewController(city: city)
        viewController?.navigationController?.pushViewController(hourlyViewController, animated: true)
    }
    
    func pushToCitySearch() {
        let searchViewController = SearchViewController()
        viewController?.navigationController?.pushViewController(searchViewController, animated: true)
    }
}
