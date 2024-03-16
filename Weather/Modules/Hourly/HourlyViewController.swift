//
//  HourlyViewController.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HourlyViewController: UIViewController, HourlyViewProtocol {

	var presenter: HourlyPresenterProtocol?
    var city: City

	override func viewDidLoad() {
        super.viewDidLoad()
        print(city)
    }
    
    init(city: City) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
