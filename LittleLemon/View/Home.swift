//
//  Home.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        Main()
            .navigationBarBackButtonHidden(true)
    }
    
    /* 
     //checking available fonts in this project
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
     */
     
}

#Preview {
    Home()
}
