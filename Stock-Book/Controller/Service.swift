//
//  Service.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/7/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import Foundation

//https://cloud.iexapis.com/stable/stock/AAPL/book?token=pk_32107d0097d54d1cbf38641d2923983c

final class Service {
    
    static let sharedInstance = Service()

    var quoteArray = [Quote]()
    var tradeArray = [[Trades]]()
    
    func bookRequest (completion: @escaping () -> ()) {
        
        self.quoteArray.removeAll()
        self.tradeArray.removeAll()
        
        let defaultUrl = "https://cloud.iexapis.com/stable/stock/"
        let token = "/book?token=pk_32107d0097d54d1cbf38641d2923983c"
        let jsonUrl = "\(defaultUrl)\("AAPL")\(token)"
        let url = URL(string: jsonUrl)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let fetchedBook = try decoder.decode(Book.self, from: data)
                
                self.quoteArray.append(fetchedBook.quote)
                self.tradeArray.append(fetchedBook.trades)
               
                completion()
                
            } catch {
                
                print("Error Parsing JSON")

            }
        }.resume()
    }
}














//                let quotes = self.quoteArray.map{ $0.self }
//                print("map: \(quotes)")





//                let trades = self.tradeArray.compactMap{ $0.self }.flatMap { $0 }
