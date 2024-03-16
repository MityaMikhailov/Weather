//
//  HourlyPresenter.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HourlyPresenter: HourlyPresenterProtocol {

    weak private var view: HourlyViewProtocol?
    var interactor: HourlyInteractorProtocol?
    private let router: HourlyWireframeProtocol

    init(interface: HourlyViewProtocol, interactor: HourlyInteractorProtocol?, router: HourlyWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
