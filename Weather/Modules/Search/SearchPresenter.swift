//
//  SearchPresenter.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class SearchPresenter: SearchPresenterProtocol {

    weak private var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    private let router: SearchWireframeProtocol

    init(interface: SearchViewProtocol, interactor: SearchInteractorProtocol?, router: SearchWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
