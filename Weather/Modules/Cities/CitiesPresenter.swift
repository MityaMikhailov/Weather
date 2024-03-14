//
//  CitiesPresenter.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class CitiesPresenter: CitiesPresenterProtocol {

    weak private var view: CitiesViewProtocol?
    var interactor: CitiesInteractorProtocol?
    private let router: CitiesWireframeProtocol
    
    private var model: Cities? {
        didSet {
            view?.updateView()
        }
    }

    init(interface: CitiesViewProtocol, interactor: CitiesInteractorProtocol?, router: CitiesWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func handleSuccess(model: Cities) {
        self.model = model
    }
    
    func handleFailure(message: String) {
        print(message)
    }
    
    func getData() -> Cities? {
        return model
    }

}
