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
                    .font(Font.custom("MarkaziText-Medium", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(Font.custom("MarkaziText-Medium", size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer(minLength: 5)

                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundColor(.white)
                    .font(Font.custom("Karla-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            
            Image(Asset.hero)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 120, maxHeight: 120)
                .clipShape(Rectangle())
                .cornerRadius(16)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 240)
    }
}

#Preview {
    Hero()
}
