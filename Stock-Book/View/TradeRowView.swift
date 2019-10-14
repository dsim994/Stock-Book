//
//  TradeRowView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/11/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

struct TradeRowView: View {
    
    let trades = Service.sharedInstance.tradeArray.flatMap{ $0.map { $0.self }}

    var body: some View {
        VStack{
            HStack {
                Text("Hello World")
//                Text("\(trades[0].price)")
//                Spacer()
//                Text("\(trades[0].size)")
//                Spacer()
//                Text("\(trades[0].tradeId)")
            }
        }
    }
}

struct TradeRowView_Previews: PreviewProvider {
    static var previews: some View {
        TradeRowView().previewLayout(.fixed(width: 500, height: 50))
    }
}

