//
//  AppView.swift
//  SwiftDishApp
//
//  Created by Alejandro Franco on 07/03/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
            FavoritesView().tabItem( {
                Image(systemName: "heart")
                Text("Fsavorites")
            })
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
