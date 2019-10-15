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
    
    var body: some View {
        NavigationView {
            VStack {
                List(mappedTrades) {
                    trades in
                    TradeRowView(trade: trades)
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
