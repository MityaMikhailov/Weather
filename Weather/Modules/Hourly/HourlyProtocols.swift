//
//  HourlyProtocols.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol HourlyWireframeProtocol: AnyObject {
    
}
//MARK: Presenter -
protocol HourlyPresenterProtocol: AnyObject {
    
}

//MARK: Interactor -
protocol HourlyInteractorProtocol: AnyObject {
    
    var presenter: HourlyPresenterProtocol?  { get set }
}

//MARK: View -
protocol HourlyViewProtocol: AnyObject {
    
    var presenter: HourlyPresenterProtocol?  { get set }
}
