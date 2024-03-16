//
//  CitiesProtocols.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol CitiesWireframeProtocol: AnyObject {
    func pushToCityHourly(with city: City)
}
//MARK: Presenter -
protocol CitiesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func handleSuccess(model: Cities)
    func handleFailure(message: String)
    func getData() -> Cities?
    func showCityHourly(for city: City)
}

//MARK: Interactor -
protocol CitiesInteractorProtocol: AnyObject {
    
    var presenter: CitiesPresenterProtocol?  { get set }
    func fetchData()
}

//MARK: View -
protocol CitiesViewProtocol: AnyObject {
    
    var presenter: CitiesPresenterProtocol?  { get set }
    func updateView()
}
