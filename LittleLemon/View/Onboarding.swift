//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var userViewModel = UserViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var isLoggedIn = false
    
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    VStack(alignment: .leading) {
                        Text("First Name *")
                        TextField("First Name", text: $firstName)
                            .padding(.bottom)
                        Text("Last Name *")
                        TextField("Last Name", text: $lastName)
                            .padding(.bottom)
                        Text("Email *")
                        TextField("Email", text: $email)
                            .padding(.bottom)
                        Text("Phone Number *")
                        TextField("Phone Number", text: $phoneNumber)
                            .padding(.bottom)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Home()
                    }
                    
                    if userViewModel.showError {
                        withAnimation() {
                            Text(userViewModel.errorMessage)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                    }
                    
                    Button("Register") {
                        if userViewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            UserDefaults.standard.set(true, forKey: kOrderStatuses)
                            UserDefaults.standard.set(true, forKey: kPasswordChanges)
                            UserDefaults.standard.set(true, forKey: kSpecialOffers)
                            UserDefaults.standard.set(true, forKey: kNewsletter)
                            firstName = ""
                            lastName = ""
                            email = ""
                            phoneNumber = ""
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(Primary2Button())
                }
                //                .offset(y: contentOffset.height)
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Onboarding()
}
