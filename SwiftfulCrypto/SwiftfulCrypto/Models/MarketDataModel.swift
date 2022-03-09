//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/9/22.
//

import Foundation
import UIKit

// JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13056,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 770,
     "total_market_cap": {
       "btc": 45675015.80302518,
       "eth": 705987228.6383504,
       "ltc": 17968359524.19992,
       "bch": 6192668355.108936,
       "bnb": 4887576636.175574,
       "eos": 932259829203.8301,
       "xrp": 2505100110276.0547,
       "xlm": 10202536934002.64,
       "link": 138117153229.59412,
       "dot": 108207574543.71152,
       "yfi": 94978707.00448813,
       "usd": 1915658413157.594,
       "aed": 7036255496012.938,
       "ars": 208222483555531.06,
       "aud": 2616749163546.596,
       "bdt": 164829801419852.4,
       "bhd": 722207053077.2412,
       "bmd": 1915658413157.594,
       "brl": 9602620927635.086,
       "cad": 2454182559289.2173,
       "chf": 1773746437910.8809,
       "clp": 1541753819188002.8,
       "cny": 12102555156805.74,
       "czk": 43563604841934.22,
       "dkk": 12874373931466.941,
       "eur": 1730077088724.5383,
       "gbp": 1453457929522.9985,
       "hkd": 14979586744606.48,
       "huf": 653306310232972.6,
       "idr": 27313361871880336,
       "ils": 6237728611755.483,
       "inr": 145855741221882.22,
       "jpy": 221934774139547,
       "krw": 2343403197924015.5,
       "kwd": 581727990323.5654,
       "lkr": 435905840171959.2,
       "mmk": 3407067886358116,
       "mxn": 40034714924962.64,
       "myr": 8020861775890.834,
       "ngn": 796900775697771.1,
       "nok": 17060284877032.816,
       "nzd": 2800855431001.5234,
       "php": 99618890618480.33,
       "pkr": 343004470140077.06,
       "pln": 8269583201621.568,
       "rub": 261008458792722.4,
       "sar": 7186956512059.228,
       "sek": 18547692104953.81,
       "sgd": 2602489002319.052,
       "thb": 63215742985776.305,
       "try": 28076081269079.01,
       "twd": 54238036651730.95,
       "uah": 57578910442426.25,
       "vef": 191814876909.4701,
       "vnd": 43751477404937600,
       "zar": 28739464199263.45,
       "xdr": 1374306755208.1511,
       "xag": 74326684384.22894,
       "xau": 962005341.9194824,
       "bits": 45675015803025.18,
       "sats": 4567501580302518
     },
     "total_volume": {
       "btc": 2404363.5641292874,
       "eth": 37163642.736303896,
       "ltc": 945866535.2952179,
       "bch": 325986228.92592865,
       "bnb": 257285322.71535206,
       "eos": 49074784676.71645,
       "xrp": 131870155351.86908,
       "xlm": 537068408943.48535,
       "link": 7270579877.599145,
       "dot": 5696119531.029741,
       "yfi": 4999743.042772572,
       "usd": 100841547811.98311,
       "aed": 370393223627.4661,
       "ars": 10960971636057.314,
       "aud": 137747436638.66483,
       "bdt": 8676751651836.545,
       "bhd": 38017465208.21336,
       "bmd": 100841547811.98311,
       "brl": 505488426717.12854,
       "cad": 129189821208.24435,
       "chf": 93371205950.07147,
       "clp": 81158958405161.34,
       "cny": 637086646611.7662,
       "czk": 2293217470482.746,
       "dkk": 677715706225.2145,
       "eur": 91072422026.1494,
       "gbp": 76511003363.64703,
       "hkd": 788535525193.1934,
       "huf": 34390483745292.25,
       "idr": 1437793746625865.8,
       "ils": 328358231154.42255,
       "inr": 7677944356392.244,
       "jpy": 11682795838661.693,
       "krw": 123358321088514.53,
       "kwd": 30622552824.06485,
       "lkr": 22946376724213.555,
       "mmk": 179350345970364.62,
       "mxn": 2107454330853.4053,
       "myr": 422223560688.77264,
       "ngn": 41949393024340.945,
       "nok": 898064874873.821,
       "nzd": 147438914432.68344,
       "php": 5244005430342.751,
       "pkr": 18055986097407.125,
       "pln": 435316423890.48956,
       "rub": 13739660889382.71,
       "sar": 378326226510.7396,
       "sek": 976362992147.7927,
       "sgd": 136996772156.75247,
       "thb": 3327719245239.871,
       "try": 1477943808887.2056,
       "twd": 2855126743200.6777,
       "uah": 3030992587436.9097,
       "vef": 10097264182.41388,
       "vnd": 2303107208608572.5,
       "zar": 1512864732686.7578,
       "xdr": 72344432291.15143,
       "xag": 3912606676.40844,
       "xau": 50640608.48022177,
       "bits": 2404363564129.2876,
       "sats": 240436356412928.75
     },
     "market_cap_percentage": {
       "btc": 41.552141831930854,
       "eth": 16.982317612370473,
       "usdt": 4.1778021005349535,
       "bnb": 3.4401054864351237,
       "usdc": 2.7327184420200554,
       "xrp": 1.9138750728340865,
       "luna": 1.875706058008438,
       "sol": 1.4685962819538938,
       "ada": 1.412698897643081,
       "avax": 1.0691188592956844
     },
     "market_cap_change_percentage_24h_usd": 6.71531388866873,
     "updated_at": 1646864503
   }
 }


 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        // Alternate
//        if let item = totalMarketCap.first(where: { (key, value) -> Bool in
//            return key == "usd"
//        }) {
//            return "\(item.value)"
//        }
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
