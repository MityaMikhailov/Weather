//
//  HourlyRouter.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HourlyRouter: HourlyWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(city: City) -> UIViewController {
        let view = HourlyViewController(city: city)
        let interactor = HourlyInteractor()
        let router = HourlyRouter()
        let presenter = HourlyPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
