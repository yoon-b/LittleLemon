//
//  Menu.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    private func getMenuData() -> Void {
        PersistenceController.shared.clear()
        
        let littleLemonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: littleLemonAddress)!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data else { return }
            
            var result: MenuList?
            
            do {
                result = try JSONDecoder().decode(MenuList.self, from: data)
            } catch {
                print("Failed to convert. \(error)")
            }
            
            guard let menuList = result?.menu else { return }
            
            for dish in menuList {
                let newDish = Dish(context: viewContext)
                newDish.title = dish.title
                newDish.price = dish.price
                newDish.category = dish.category
                newDish.descriptionDish = dish.descriptionDish
                newDish.image = dish.image
            }
            try? viewContext.save()
        }
        task.resume()
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
    
    private func buildPredicate() -> NSPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
    
    
    var body: some View {
        VStack {
            VStack {
                Hero()
                //                .frame(maxHeight: 170)
                
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            .background(Color.primaryColor1)
            
            Text("Order for Delivery!")
                .foregroundColor(.highlightColor2)
                .font(Font.custom("Karla-Regular", size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersIsEnabled)
                    Toggle("Mains", isOn: $mainsIsEnabled)
                    Toggle("Desserts", isOn: $dessertsIsEnabled)
                    Toggle("Drinks", isOn: $drinksIsEnabled)
                }
                .toggleStyle(CategoryToggleStyle())
                .padding(.horizontal)
            }
            
            FetchedObjects(predicate: buildPredicate(),
                           sortDescriptors: buildSortDescriptors()) {
                (dishes: [Dish]) in
                List(dishes) {dish in
                    NavigationLink(destination: Detail(dish: dish)) {
                        DishView(dish: dish)
                    }
                }
                .listStyle(.plain)
            }
        }
        .onAppear() {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}
