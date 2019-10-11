//
//  BookView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/8/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

struct BookView: View {
    
    let quote = Service.sharedInstance.quoteArray
    let trades = Service.sharedInstance.tradeArray.flatMap{ $0.map { $0.self }}
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("\(quote[0].symbol)")
                
                List() {
                    
                    HStack {
                        Text("Trade Price")
                        Spacer()
                        Text("Trade Size")
                        Spacer()
                        Text("Trade ID")
                    }
                    
                    HStack {
                        Text("\(trades[0].price)")
                        Spacer()
                        Text("\(trades[0].size)")
                        Spacer()
                        Text("\(trades[0].tradeId)")
                    }
                }
            }
        }.navigationBarTitle(Text("\(quote[0].companyName)"), displayMode: .inline)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
