//
//  Service.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/7/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import Foundation

final class Service {
    
    static let sharedInstance = Service()

    var quoteArray = [Quote]()
    var bidArray = [[Bids]]()
    var askArray = [[Asks]]()
    var tradeArray = [[Trades]]()
    
    
    func bookRequest (completion: @escaping () -> ()) {
        
        self.removeArrayData()
        
        
        let defaultUrl = "https://cloud.iexapis.com/stable/stock/"
        let token = "/book?token=pk_32107d0097d54d1cbf38641d2923983c"
        let jsonUrl = "\(defaultUrl)\("AAPL")\(token)"
        let url = URL(string: jsonUrl)
        
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                fatalError("Error: invalid HTTP response code")
            }
            guard let data = data else {
                fatalError("Error: missing response data")
            }
            
            
            
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let fetchedBook = try decoder.decode(Book.self, from: data)
                
                self.quoteArray.append(fetchedBook.quote)
                print(self.quoteArray.map {$0.self })
                
                self.bidArray.append(fetchedBook.bids)
                print(self.bidArray.map {$0.self})
                
                self.askArray.append(fetchedBook.asks)
                print(self.askArray.map {$0.self})
                
                if fetchedBook.trades == nil {
                    print("Trade data is null")
                } else {
                    self.tradeArray.append(fetchedBook.trades!)
                    print("compactMap: \(self.tradeArray.compactMap{ $0.self }.flatMap { $0 })")
                }
                
                completion()
                
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    
    
    func removeArrayData() {
        self.quoteArray.removeAll()
        self.bidArray.removeAll()
        self.askArray.removeAll()
        self.tradeArray.removeAll()
    }
}


