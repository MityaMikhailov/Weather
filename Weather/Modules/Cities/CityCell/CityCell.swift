//
//  CityCell.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import UIKit
import SnapKit

final class CityCell: UITableViewCell {
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "City"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(cityLabel)
        
        cityLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
