//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
    let lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
    let email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Personal information")
                    .font(Font.custom("Karla-Regular", size: 18))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Avatar")
                    HStack {
                        Image(Asset.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(Primary1Button())
                        Button("Remove") {}
                            .buttonStyle(ReversePrimary1Button())
                    }
                    
                    
                    VStack {
                        Text("First name")
                    }
                    
                    VStack {
                        Text("Last name")
                    }
                    
                    VStack {
                        Text("E-mail")
                    }
                    
                    VStack {
                        Text("Phone number")
                    }
                }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .padding()
                
                Text("Email notifications")
                    .font(Font.custom("Marzaki Text", size: 18))
                
                VStack(alignment: .leading) {
                    Toggle("Order statuses", isOn: $orderStatuses)
                    Toggle("Password changes", isOn: $passwordChanges)
                    Toggle("Special offers", isOn: $specialOffers)
                    Toggle("Newsletter", isOn: $newsletter)
                }
                .padding()
                .font(Font.custom("Karla-Regular", size: 16))
                .toggleStyle(CheckboxToggleStyle())
                
                Button("Log out") {
                    UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(Primary2Button())
                
                Spacer(minLength: 20)
                
                HStack {
                    Button("Discard changes") { }
                        .buttonStyle(ReversePrimary1Button())
                    Button("Save changes") { }
                        .buttonStyle(Primary1Button())
                }
            }
        }
    }
}

#Preview {
    UserProfile()
}
