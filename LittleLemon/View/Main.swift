//
//  Main.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Main: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        VStack {
            Header()
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}

#Preview {
    Main()
}
