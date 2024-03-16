//
//  SearchViewController.swift
//  Weather
//
//  Created Mitya Mikhailov on 16.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class SearchViewController: UIViewController, SearchViewProtocol {

	var presenter: SearchPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}
