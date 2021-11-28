//
//  ContentView.swift
//  AppleStockApp
//
//  Created by naseem on 26/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -250)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 200)
                    
            }
            .navigationBarTitle("Stocks")
            .edgesIgnoringSafeArea(Edge.Set(.bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
