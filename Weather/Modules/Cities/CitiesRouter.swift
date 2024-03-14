//
//  CitiesRouter.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class CitiesRouter: CitiesWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = CitiesViewController()
        let interactor = CitiesInteractor()
        let router = CitiesRouter()
        let presenter = CitiesPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
