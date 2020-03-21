//
//  Favorites.swift
//  SwiftDishApp
//
//  Created by Alejandro Franco on 20/03/20.
//  Copyright © 2020 Alejandro Franco. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
