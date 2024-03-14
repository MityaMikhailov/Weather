//
//  CityCell.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import UIKit
import SnapKit

final class CityCell: UITableViewCell {
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "sun")
        imageView.image = image
        return imageView
    }()
    
    private lazy var zeroLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "15:00"
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "City"
        return label
    }()
    
    private lazy var currentTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "+3"
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "0"
        return label
    }()
    
    private lazy var tempProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.4
        return progressView
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.text = "8"
        return label
    }()
    
    private lazy var progressStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.addArrangedSubview(minTempLabel)
        stack.addArrangedSubview(tempProgressView)
        stack.addArrangedSubview(maxTempLabel)
        return stack
    }()
    
    private lazy var currentImageTimeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(weatherImageView)
        stack.addArrangedSubview(zeroLabel)
        stack.addArrangedSubview(currentTimeLabel)
        return stack
    }()
    
    private lazy var cityTempProgressStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(cityLabel)
        stack.addArrangedSubview(currentTempLabel)
        stack.addArrangedSubview(progressStack)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Cities, city: Int) {
        guard let timezone = model[city].timezone,
              let weatherCode = model[city].current?.weatherCode,
              let currentTemp = model[city].current?.temperature2M,
              let minTemp = model[city].daily?.temperature2MMin![0],
              let maxTemp = model[city].daily?.temperature2MMax![0] else { return }
        
        let cityText = getCity(with: timezone)
        let currentTime = getCurrentTime(withTimeZone: timezone)
        let progress = progressTemp(max: maxTemp, min: minTemp, current: currentTemp)
        
        if (6...18).contains((Int(currentTime.components(separatedBy: ":").first!)!)) {
            let weatherType = DayWeatherType(rawValue: weatherCode)!
            let image = UIImage(named: weatherType.imageName)
            zeroLabel.text = weatherType.shortDescription
            weatherImageView.image = image
        } else {
            let weatherType = NightWeatherType(rawValue: weatherCode)!
            let image = UIImage(named: weatherType.imageName)
            zeroLabel.text = weatherType.shortDescription
            weatherImageView.image = image
        }
        
        cityLabel.text = cityText
        currentTempLabel.text = String(currentTemp)
        minTempLabel.text = String(minTemp)
        tempProgressView.progress = progress
        maxTempLabel.text = String(maxTemp)
        currentTimeLabel.text = currentTime
    }
    
    private func getCity(with timeZone: String) -> String {
        let components = timeZone.components(separatedBy: "/")
            if let lastComponent = components.last {
                return lastComponent
            }
            return timeZone
    }
    
    private func progressTemp(max: Double, min: Double, current: Double) -> Float {
        return Float((current - min)/(max - min))
    }
    
    private func getCurrentTime(withTimeZone timeZone: String) -> String {
        let formatter = DateFormatter()
        let timeZone = TimeZone(identifier: timeZone)
        formatter.timeZone = timeZone
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: Date())
        return time
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(currentImageTimeStack)
        addSubview(cityTempProgressStack)
        
        zeroLabel.snp.makeConstraints {
            $0.height.equalTo(currentTempLabel.snp.height)
        }
        
        currentImageTimeStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        cityTempProgressStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalTo(currentImageTimeStack.snp.right).offset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
        }
        
    }
    
}
