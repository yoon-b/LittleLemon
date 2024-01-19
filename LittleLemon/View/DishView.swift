//
//  DishView.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/19/24.
//

import SwiftUI

struct DishView: View {
    
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 16))
                
                Spacer(minLength: 10)
                
                Text(dish.descriptionDish ?? "tomato, basil, mozarella")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 14))
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                
                Spacer(minLength: 5)
                
                Text("$\(dish.price ?? "")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Karla Regular", size: 14))
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

#Preview {
    DishView(dish: PersistenceController.getExampleDish())
}
