//
//  BookView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 10/8/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

struct BookView: View {
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    Text("\(Service.sharedInstance.quoteArray[0].iexRealtimePrice)")
                    Text("\(Service.sharedInstance.quoteArray[0].symbol)")
                }
            }
        }.navigationBarTitle(Text("\(Service.sharedInstance.quoteArray[0].companyName)"), displayMode: .inline)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
