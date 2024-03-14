//
//  EnumWeather.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import Foundation

enum NightWeatherType: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case fortyFive = 45
    case fortyEight = 48
    case fiftyOne = 51
    case fiftyThree = 53
    case fiftyFive = 55
    case fiftySix = 56
    case fiftySeven = 57
    case sixtyOne = 61
    case sixtyThree = 63
    case sixtyFive = 65
    case sixtySix = 66
    case sixtySeven = 67
    case seventyOne = 71
    case seventyThree = 73
    case seventyFive = 75
    case seventySeven = 77
    case eighty = 80
    case eightyOne = 81
    case eightyTwo = 82
    case eightyFive = 85
    case eightySix = 86
    case ninetyFive = 95
    case ninetySix = 96
    case ninetyNine = 99

    var imageName: String {
        switch self {
        case .zero, .one:
            return "01night"
        case .two:
            return "02night"
        case .three:
            return "03night"
        case .fortyFive, .fortyEight:
            return "50night"
        case .fiftyOne, .fiftyThree, .fiftyFive, .fiftySix, .fiftySeven, .eighty, .eightyOne, .eightyTwo:
            return "09night"
        case .sixtyOne, .sixtyThree, .sixtyFive, .sixtySix, .sixtySeven:
            return "10night"
        case .seventyOne, .seventyThree, .seventyFive, .seventySeven, .eightyFive, .eightySix:
            return "13night"
        case .ninetyFive, .ninetySix, .ninetyNine:
            return "11night"
        }
    }
    
    var shortDescription: String {
        switch self {
        case .zero, .one:
            return "Ясно"
        case .two, .three:
            return "Облачно"
        case .fortyFive, .fortyEight:
            return "Туманно"
        case .fiftyOne, .fiftyThree, .fiftyFive, .fiftySix, .fiftySeven:
            return "Моросящий дождь"
        case .sixtyOne, .sixtyThree, .sixtyFive:
            return "Дождь"
        case .sixtySix, .sixtySeven:
            return "Ледяной дождь"
        case .seventyOne, .seventyThree, .seventyFive, .seventySeven:
            return "Снег"
        case .eighty, .eightyOne, .eightyTwo:
            return "Ливень"
        case .eightyFive, .eightySix:
            return "Снегопады"
        case .ninetyFive:
            return "Гроза"
        case .ninetySix, .ninetyNine:
            return "Гроза с градом"
        }
    }
    
    var description: String {
        switch self {
        case .zero:
            return "Ясно"
        case .one:
            return "В основном ясно"
        case .two:
            return "Частично облачно"
        case .three:
            return "Облачно"
        case .fortyFive:
            return "Туманно"
        case .fortyEight:
            return "Инейный туман"
        case .fiftyOne:
            return "Небольшой моросящий дождь"
        case .fiftyThree:
            return "Моросящий дождь"
        case .fiftyFive:
            return "Сильный моросящий дождь"
        case .fiftySix:
            return "Небольшой ледяной моросящий дождь"
        case .fiftySeven:
            return "Ледяной моросящий дождь"
        case .sixtyOne:
            return "Небольшой дождь"
        case .sixtyThree:
            return "Дождь"
        case .sixtyFive:
            return "Сильный дождь"
        case .sixtySix:
            return "Небольшой ледяной дождь"
        case .sixtySeven:
            return "Ледяной дождь"
        case .seventyOne:
            return "Небольшой снег"
        case .seventyThree:
            return "Снег"
        case .seventyFive:
            return "Сильный снег"
        case .seventySeven:
            return "Снежные зерна"
        case .eighty:
            return "Небольшие ливни"
        case .eightyOne:
            return "Ливни"
        case .eightyTwo:
            return "Сильные ливни"
        case .eightyFive:
            return "Небольшие снегопады"
        case .eightySix:
            return "Снегопады"
        case .ninetyFive:
            return "Гроза"
        case .ninetySix:
            return "Небольшие грозы с градом"
        case .ninetyNine:
            return "Гроза с градом"
        }
    }
}

enum DayWeatherType: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case fortyFive = 45
    case fortyEight = 48
    case fiftyOne = 51
    case fiftyThree = 53
    case fiftyFive = 55
    case fiftySix = 56
    case fiftySeven = 57
    case sixtyOne = 61
    case sixtyThree = 63
    case sixtyFive = 65
    case sixtySix = 66
    case sixtySeven = 67
    case seventyOne = 71
    case seventyThree = 73
    case seventyFive = 75
    case seventySeven = 77
    case eighty = 80
    case eightyOne = 81
    case eightyTwo = 82
    case eightyFive = 85
    case eightySix = 86
    case ninetyFive = 95
    case ninetySix = 96
    case ninetyNine = 99

    var imageName: String {
        switch self {
        case .zero, .one:
            return "01day"
        case .two:
            return "02day"
        case .three:
            return "03day"
        case .fortyFive, .fortyEight:
            return "50day"
        case .fiftyOne, .fiftyThree, .fiftyFive, .fiftySix, .fiftySeven, .eighty, .eightyOne, .eightyTwo:
            return "09day"
        case .sixtyOne, .sixtyThree, .sixtyFive, .sixtySix, .sixtySeven:
            return "10day"
        case .seventyOne, .seventyThree, .seventyFive, .seventySeven, .eightyFive, .eightySix:
            return "13day"
        case .ninetyFive, .ninetySix, .ninetyNine:
            return "11day"
        }
    }
    
    var shortDescription: String {
        switch self {
        case .zero, .one:
            return "Солнечно"
        case .two, .three:
            return "Облачно"
        case .fortyFive, .fortyEight:
            return "Туманно"
        case .fiftyOne, .fiftyThree, .fiftyFive, .fiftySix, .fiftySeven:
            return "Моросящий дождь"
        case .sixtyOne, .sixtyThree, .sixtyFive:
            return "Дождь"
        case .sixtySix, .sixtySeven:
            return "Ледяной дождь"
        case .seventyOne, .seventyThree, .seventyFive, .seventySeven:
            return "Снег"
        case .eighty, .eightyOne, .eightyTwo:
            return "Ливень"
        case .eightyFive, .eightySix:
            return "Снегопады"
        case .ninetyFive:
            return "Гроза"
        case .ninetySix, .ninetyNine:
            return "Гроза с градом"
        }
    }
    
    var description: String {
        switch self {
        case .zero:
            return "Солнечно"
        case .one:
            return "В основном солнечно"
        case .two:
            return "Частично облачно"
        case .three:
            return "Облачно"
        case .fortyFive:
            return "Туманно"
        case .fortyEight:
            return "Инейный туман"
        case .fiftyOne:
            return "Небольшой моросящий дождь"
        case .fiftyThree:
            return "Моросящий дождь"
        case .fiftyFive:
            return "Сильный моросящий дождь"
        case .fiftySix:
            return "Небольшой ледяной моросящий дождь"
        case .fiftySeven:
            return "Ледяной моросящий дождь"
        case .sixtyOne:
            return "Небольшой дождь"
        case .sixtyThree:
            return "Дождь"
        case .sixtyFive:
            return "Сильный дождь"
        case .sixtySix:
            return "Небольшой ледяной дождь"
        case .sixtySeven:
            return "Ледяной дождь"
        case .seventyOne:
            return "Небольшой снег"
        case .seventyThree:
            return "Снег"
        case .seventyFive:
            return "Сильный снег"
        case .seventySeven:
            return "Снежные зерна"
        case .eighty:
            return "Небольшие ливни"
        case .eightyOne:
            return "Ливни"
        case .eightyTwo:
            return "Сильные ливни"
        case .eightyFive:
            return "Небольшие снегопады"
        case .eightySix:
            return "Снегопады"
        case .ninetyFive:
            return "Гроза"
        case .ninetySix:
            return "Небольшие грозы с градом"
        case .ninetyNine:
            return "Гроза с градом"
        }
    }
}
