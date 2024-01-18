//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
    let lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
    let email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information")
            Image(Asset.profile)
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
