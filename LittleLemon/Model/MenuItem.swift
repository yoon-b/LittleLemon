//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let descriptionDish: String
    let category: String
}
