//
//  TradeRowView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/11/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

let mappedTrades = Service.sharedInstance.tradeArray.compactMap{ $0.self }.flatMap { $0 }

struct TradeRowView: View {
    
    var trade: Trades
    
    
    var body: some View {
        HStack {
            Text("\(trade.price)")
            .font(.body)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)

            Spacer()

            Text("\(trade.size)")
            .font(.body)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)

            Spacer()

            Text("\(trade.tradeId)")
            .font(.body)
            .fontWeight(.bold)
            .minimumScaleFactor(0.5)

        }
    }
}

struct TradeRowView_Previews: PreviewProvider {
    static var previews: some View {
        TradeRowView(trade: mappedTrades[0]).previewLayout(.fixed(width: 500, height: 50))
    }
}

