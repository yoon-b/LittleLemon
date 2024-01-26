//
//  Header.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(Asset.logo)
            
            Spacer()
            
            if isLoggedIn {
                NavigationLink(destination: UserProfile()) {
                    Image(Asset.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }
        }
        .frame(maxHeight: 60)
//        .padding(.bottom)
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    Header()
}
