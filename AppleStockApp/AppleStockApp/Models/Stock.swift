//
//  Stock.swift
//  AppleStockApp
//
//  Created by naseem on 26/11/2021.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String 
}
