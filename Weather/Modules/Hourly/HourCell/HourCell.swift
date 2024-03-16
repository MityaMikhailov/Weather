//
//  HourCell.swift
//  Weather
//
//  Created by Mitya Mikhailov on 16.03.2024.
//

import UIKit

final class HourCell: UITableViewCell {
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "ЧТ 16:00"
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let image = UIImage(named: "09night")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
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
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.systemCyan
        self.selectedBackgroundView = selectedView
        self.backgroundColor = .white
        addSubview(timeLabel)
        addSubview(weatherImage)
        addSubview(temperatureLabel)
        addSubview(descriptionLabel)
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        weatherImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(timeLabel.snp.right).offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(weatherImage.snp.right).offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(temperatureLabel.snp.right).offset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.right.equalToSuperview().inset(8)
        }
        
    }
    
    func configure(model: City, index: Int) {
        guard let time = model.hourly?.time![index],
        let timeConvert = convertDate(time),
        let weatherCode = model.hourly?.weatherCode![index],
        let temperature = model.hourly?.temperature2M![index] else { return }
    
        let hour = timeConvert.components(separatedBy: " ").last!.components(separatedBy: ":").first
        
        if (6...19).contains(Int(hour!)!) {
            let weatherConditions = DayWeatherType(rawValue: weatherCode)!
            let imageName = weatherConditions.imageName
            let description = weatherConditions.description
            
            let image = UIImage(named: imageName)
            weatherImage.image = image
            descriptionLabel.text = description
        } else {
            let weatherConditions = NightWeatherType(rawValue: weatherCode)!
            let imageName = weatherConditions.imageName
            let description = weatherConditions.description
            
            let image = UIImage(named: imageName)
            weatherImage.image = image
            descriptionLabel.text = description
        }
        
        timeLabel.text = convertDate(time)
        temperatureLabel.text = String(temperature)
    }
    
    func convertDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEE HH:mm"
            let formattedString = dateFormatter.string(from: date)
            return formattedString
        } else {
            return nil
        }
    }
    
}
