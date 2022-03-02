//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/2/22.
//

import Foundation

// API Info = coingecko.com
/*
 
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
    {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 44146,
     "market_cap": 838343751477,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 927919780501,
     "total_volume": 25834791768,
     "high_24h": 44969,
     "low_24h": 43471,
     "price_change_24h": -1.039560039972,
     "price_change_percentage_24h": -0.00235,
     "market_cap_change_24h": -61821105.771728516,
     "market_cap_change_percentage_24h": -0.00737,
     "circulating_supply": 18972781,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -36.05364,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 65011.73359,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-03-02T23:16:31.648Z",
     "sparkline_in_7d": {
       "price": [
         38242.43334687232,
         37848.229207406075
       ]
     },
     "price_change_percentage_24h_in_currency": -0.0023547412455416313
    }
 
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: <#T##String#>, symbol: <#T##String#>, name: <#T##String#>, image: <#T##String#>, currentPrice: <#T##Double#>, marketCap: <#T##Double?#>, marketCapRank: <#T##Double?#>, fullyDilutedValuation: <#T##Double?#>, totalVolume: <#T##Double?#>, high24H: <#T##Double?#>, low24H: <#T##Double?#>, priceChange24H: <#T##Double?#>, priceChangePercentage24H: <#T##Double?#>, marketCapChange24H: <#T##Double?#>, marketCapChangePercentage24H: <#T##Double?#>, circulatingSupply: <#T##Double?#>, totalSupply: <#T##Double?#>, maxSupply: <#T##Double?#>, ath: <#T##Double?#>, athChangePercentage: <#T##Double?#>, athDate: <#T##String?#>, atl: <#T##Double?#>, atlChangePercentage: <#T##Double?#>, atlDate: <#T##String?#>, lastUpdated: <#T##String?#>, sparklineIn7D: <#T##SparklineIn7D?#>, priceChangePercentage24HInCurrency: <#T##Double?#>, currentHoldings: <#T##Double?#>)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
