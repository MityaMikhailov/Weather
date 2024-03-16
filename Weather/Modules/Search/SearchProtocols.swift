//
//  SearchProtocols.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol SearchWireframeProtocol: AnyObject {
    
}
//MARK: Presenter -
protocol SearchPresenterProtocol: AnyObject {
    
}

//MARK: Interactor -
protocol SearchInteractorProtocol: AnyObject {
    
    var presenter: SearchPresenterProtocol?  { get set }
}

//MARK: View -
protocol SearchViewProtocol: AnyObject {
    
    var presenter: SearchPresenterProtocol?  { get set }
}
