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
    var model: Cities?
    
    private lazy var citiesTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.dataSource = self
        return table
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(citiesTable)
        
        citiesTable.snp.makeConstraints {
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func updateView() {
        citiesTable.reloadData()
    }

}

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model = presenter?.getData()
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CityCell(style: .default, reuseIdentifier: "CityCell")
        cell.configure(with: model!, city: indexPath.row)
        return cell
    }
    
    
}
