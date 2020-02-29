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
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MenuItem.example)
    }
}
