//
//  ContentView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 9/26/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Button("Search"){
                    Service.sharedInstance.bookRequest{
                        print(Service.sharedInstance.quoteArray)
                    }
                }
            }
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}










