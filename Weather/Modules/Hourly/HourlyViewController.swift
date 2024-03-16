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
    private let city: City
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = city.timezone?.components(separatedBy: "/").last
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var hourlyTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.dataSource = self
        return table
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollAndDeselect()
    }
    
    init(city: City) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(cityLabel)
        view.addSubview(hourlyTable)
        
        cityLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        hourlyTable.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(16)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
    }
    
    private func scrollAndDeselect() {
        hourlyTable.isUserInteractionEnabled = false
        
        guard let index = findIndex() else { return }
        let indexPath = IndexPath(row: index, section: 0)
    
        hourlyTable.scrollToRow(at: indexPath, at: .top, animated: true)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hourlyTable.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.hourlyTable.deselectRow(at: indexPath, animated: true)
                self.hourlyTable.allowsSelection = false
                self.hourlyTable.isUserInteractionEnabled = true
            }
        }
    }
    
    private func findIndex() -> Int?{
        guard let timezoneAbbreviation = city.timezone,
              let arrayTime = city.hourly?.time else {return 0}
        
        let currentTime = getCurrentTime(withTimeZone: timezoneAbbreviation)
        let index = arrayTime.firstIndex(of: currentTime)
        
        return index
    }
    
    func getCurrentTime(withTimeZone timezoneAbbreviation: String) -> String {
        let timezone = TimeZone(identifier: timezoneAbbreviation)
        let formatter = DateFormatter()
        formatter.timeZone = timezone
        formatter.dateFormat = "yyyy-MM-dd'T'HH:00"
        let currentTime = formatter.string(from: Date())
        return currentTime
    }
    
}

extension HourlyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.hourly?.time?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HourCell(style: .default, reuseIdentifier: "HourCell")
        cell.configure(model: city, index: indexPath.row)
        return cell
    }
    
    
}
