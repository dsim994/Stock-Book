//
//  Constants.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 9/27/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import Foundation

struct Book: Decodable {
    let quote: Quote
    let bids: [Bids]
    let asks: [Asks]
    let trades: [Trades]
}

struct Quote: Decodable {
    let symbol: String
    let companyName: String
    let iexRealtimePrice: Double
    let isUSMarketOpen: Bool
}

struct Bids: Decodable {
    let price: Double
    let size: Double
    let timestamp: Double
}

struct Asks: Decodable {
    let price: Double
    let size: Double
    let timestamp: Double
}

struct Trades: Decodable {
    let price: Double
    let size: Double
    let tradeId: Double
}
