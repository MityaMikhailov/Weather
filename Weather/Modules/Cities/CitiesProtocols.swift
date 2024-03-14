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
    
}
//MARK: Presenter -
protocol CitiesPresenterProtocol: AnyObject {
    
}

//MARK: Interactor -
protocol CitiesInteractorProtocol: AnyObject {
    
    var presenter: CitiesPresenterProtocol?  { get set }
}

//MARK: View -
protocol CitiesViewProtocol: AnyObject {
    
    var presenter: CitiesPresenterProtocol?  { get set }
}
