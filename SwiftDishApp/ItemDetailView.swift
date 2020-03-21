//
//  ItemDetailView.swift
//  SwiftDishApp
//
//  Created by Alejandro Franco on 29/02/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favoritos: Favorites
    
    var body: some View {
        VStack () {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .opacity(0.9)
                    .offset(x: -5, y: -5)
            }
            Text(item.description).padding()
//            Button("Order this!") {
//                self.order.add(item: self.item)
//            }
            Button(action:{self.order.add(item: self.item)}){
                HStack{
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                    Text("Order this")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(30)
            }
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            if self.favoritos.items.contains(self.item) {
                self.favoritos.remove(item: self.item)
            } else {
                self.favoritos.add(item: self.item)
            }
            
        }) {
            if self.favoritos.items.contains(self.item) {
                Image(systemName: "heart.fill")
            } else {
                Image(systemName: "heart")
            }
        })
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let order = Order()
    static let favoritos = Favorites()
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: MenuItem.example).environmentObject(order).environmentObject(favoritos)
        }
    }
}
