//
//  Hero.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Hero: View {
    // Heading, Sub Heading, About, Image, Search
    
    var body: some View {
        HStack {
            VStack {
                Text("Little Lemon")
                    .foregroundColor(.primaryColor2)
                
                Text("Chicago")
                    .foregroundColor(.white)

                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundColor(.white)
            }
            Image(Asset.hero)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 120, maxHeight: 140)
                .clipShape(Rectangle())
                .cornerRadius(16)
        }
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
    }
}

#Preview {
    Hero()
}
