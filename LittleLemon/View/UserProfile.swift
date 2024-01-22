//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @StateObject private var userViewModel = UserViewModel()
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    private func resetUserInfo() -> Void {
        firstName = userViewModel.firstName
        lastName = userViewModel.lastName
        email = userViewModel.email
        phoneNumber = userViewModel.phoneNumber
        
        orderStatuses = userViewModel.orderStatuses
        passwordChanges = userViewModel.passwordChanges
        specialOffers = userViewModel.specialOffers
        newsletter = userViewModel.newsletter
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Personal information")
                    .font(Font.custom("Karla-Regular", size: 18))
                    .padding(.leading)
                
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
                        Button("Remove") { }
                            .buttonStyle(ReversePrimary1Button())
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("First name")
                        TextField("First Name", text: $firstName)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Last name")
                        TextField("Last Name", text: $lastName)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("E-mail")
                        TextField("E-mail", text: $email)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Phone number")
                        TextField("Phone Number", text: $phoneNumber)
                    }
                    .padding(.bottom)
                }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled(true)
                .padding()
                
                Text("Email notifications")
                    .font(Font.custom("Marzaki Text", size: 18))
                    .padding(.leading)
                    .padding(.top)
                
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
                    Spacer()
                    Button("Discard changes") {
                        resetUserInfo()
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ReversePrimary1Button())
                    Button("Save changes") {
                        if userViewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            userViewModel.updateUserInfo(firstName: firstName, lastName: lastName,
                                                         email: email, phoneNumber: phoneNumber,
                                                         orderStatuses: orderStatuses,
                                                         passwordChanges: passwordChanges,
                                                         specialOffers: specialOffers,
                                                         newsletter: newsletter)
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                    .buttonStyle(Primary1Button())
                    Spacer()
                }
                .padding(.vertical)
            }
            .alert(isPresented: $userViewModel.showError, content: {
                Alert(title: Text("Error"),
                      message: Text(userViewModel.errorMessage),
                      dismissButton: .default(Text("OK")))
            })
            .padding(.top)
        }
        .onAppear {
            resetUserInfo()
        }
        .navigationBarItems(leading:
                                HStack {
            Spacer()
            Image(Asset.logo)
            Spacer()
            Image(Asset.profile)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 50)
                .clipShape(Circle())
        })
    }
}

#Preview {
    UserProfile()
}

