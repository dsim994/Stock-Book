//
//  SearchView.swift
//  Stock-Book
//
//  Created by Dylan Simerly on 9/26/19.
//  Copyright © 2019 Dylan Simerly. All rights reserved.
//

import SwiftUI

struct SearchView: View {

   @State var selection: Int? = nil
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                NavigationLink(destination: BookView(), tag: 1, selection: self.$selection) {
                             Text("")
                         }
                
                Button("Search"){
                    Service.sharedInstance.quoteArray.removeAll()
                    Service.sharedInstance.bookRequest{
                        print(Service.sharedInstance.quoteArray)
                        self.selection = 1
                    }
                }
            }
        }
    } 
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}










