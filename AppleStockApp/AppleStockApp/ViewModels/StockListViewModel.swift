//
//  StockListViewModel.swift
//  AppleStockApp
//
//  Created by naseem on 26/11/2021.
//

import Foundation

class StockListViewModel: ObservableObject {
   @Published var searchTerm: String = ""
   @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
        
    }
}
