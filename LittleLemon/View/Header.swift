//
//  Header.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Image(Asset.logo)
            
            Spacer()
            
            NavigationLink(destination: UserProfile()) {
                Image(Asset.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 50)
                    .clipShape(Circle())
                    .padding(.trailing)
            }
        }
        .frame(maxHeight: 60)
        .padding(.bottom)
    }
}

#Preview {
    Header()
}
