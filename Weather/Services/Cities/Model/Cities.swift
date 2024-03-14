//
//  Cities.swift
//  Weather
//
//  Created by Mitya Mikhailov on 14.03.2024.
//

import Foundation

// MARK: - City
struct City: Codable {
    let latitude, longitude, generationtimeMS: Double?
    let utcOffsetSeconds: Int?
    let timezone, timezoneAbbreviation: String?
    let elevation: Int?
    let currentUnits: Units?
    let current: Current?
    let hourlyUnits: Units?
    let hourly: Hourly?
    let dailyUnits: DailyUnits?
    let daily: Daily?
    let locationID: Int?
}

// MARK: - Current
struct Current: Codable {
    let time: String?
    let interval: Int?
    let temperature2M: Double?
    let weatherCode: Int?
}

// MARK: - Units
struct Units: Codable {
    let time, interval, temperature2M, weatherCode: String?
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]?
    let temperature2MMax, temperature2MMin: [Double]?
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax, temperature2MMin: String?
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]?
    let temperature2M: [Double]?
    let weatherCode: [Int]?
}

typealias Cities = [City]

