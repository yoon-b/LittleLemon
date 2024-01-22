//
//  UserViewModel.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/22/24.
//

import Foundation


public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "email key"
public let kPhoneNumber = "phone number key"

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "newsletter key"

public let kIsLoggedIn = "isLoggedIn key"

class UserViewModel: ObservableObject {
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required."
            showError = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address."
            showError = true
            return false
        }
        
        let splitedEmail = email.split(separator: "@")
        
        guard splitedEmail.count == 2 &&
                splitedEmail[1].contains(".") else {
            errorMessage = "Invalid email address."
            showError = true
            return false
        }
        
        showError = false
        errorMessage = ""
        return true
    }
    
    func updateUserInfo(firstName: String, lastName: String, email: String, phoneNumber: String,
                        orderStatuses: Bool, passwordChanges: Bool, specialOffers: Bool, newsletter: Bool) -> Void {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
    }
}
