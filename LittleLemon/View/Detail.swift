//
//  Detail.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/19/24.
//

import SwiftUI


struct Detail: View {
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            
            Text(dish.title ?? "")
                .font(Font.custom("Markazi Text Medium", size: 32))
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            
            Text(dish.descriptionDish ?? "")
                .font(Font.custom("Markazi Text Medium", size: 18))
            Spacer(minLength: 10)
            
            Text("$\(dish.price ?? "")")
                .font(Font.custom("Karla Regular", size: 14))
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    Detail(dish: PersistenceController.getExampleDish())
}
