//
//  CitiesViewController.swift
//  Weather
//
//  Created Mitya Mikhailov on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class CitiesViewController: UIViewController, CitiesViewProtocol {

	var presenter: CitiesPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}
