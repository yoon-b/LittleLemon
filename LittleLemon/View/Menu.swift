//
//  Menu.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Hero()
            
            Text("Order for Delivery")
                .foregroundColor(.highlightColor2)
            
            ScrollView(.horizontal) {
                HStack {
                    Text("Starters")
                    Text("Mains")
                    Text("Desserts")
                    Text("Drinks")
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Menu()
}
