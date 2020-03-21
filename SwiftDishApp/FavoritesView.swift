//
//  FavoritesView.swift
//  SwiftDishApp
//
//  Created by Alejandro Franco on 20/03/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favoritos: Favorites
    
    func deleteItems(at offsets: IndexSet) {
        favoritos.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(favoritos.items) { item in
                        ItemView(item: item)
                    }.onDelete(perform: deleteItems)
                }
            }
            .navigationBarTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favoritos = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favoritos)
    }
}
